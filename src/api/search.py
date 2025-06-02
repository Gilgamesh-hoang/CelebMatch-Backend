import http
from datetime import date, datetime
from typing import List, Optional, Literal, Dict

from fastapi import APIRouter
from pydantic import BaseModel, Field
from starlette.responses import JSONResponse

from src.service.semantic_search_service import SematicSearchService

router = APIRouter()

# Schema request
class FormData(BaseModel):
    gender: Optional[Literal["MALE", "FEMALE"]] = None
    songs: Optional[List[str]] = Field(default_factory=list)
    awards: Optional[List[str]] = Field(default_factory=list)
    bio: Optional[str] = None

def convert_json_compatible(obj):
    if isinstance(obj, (date, datetime)):
        return obj.isoformat()
    if isinstance(obj, set):
        return list(obj)
    if isinstance(obj, dict):
        return {k: convert_json_compatible(v) for k, v in obj.items()}
    if isinstance(obj, list):
        return [convert_json_compatible(v) for v in obj]
    return obj

@router.post("/search")
def process_form(data: FormData) -> Dict[str, List[float]]:
    if not data.songs and not data.awards and not data.bio:
        raise JSONResponse(status_code=http.HTTPStatus.BAD_REQUEST, content={"At least one of songs, awards, or bio must be non-empty"})
    service = SematicSearchService()
    result = service.search(songs=data.songs, awards=data.awards, bio=data.bio)
    result = convert_json_compatible(result)
    return JSONResponse(status_code=http.HTTPStatus.OK, content=result);
