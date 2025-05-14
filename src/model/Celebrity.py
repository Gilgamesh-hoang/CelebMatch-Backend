# src/model.py
class Celebrity:
    def __init__(self, id, full_name, occupation, nationality, birth_date, residence, biography):
        self.id = id
        self.full_name = full_name
        self.occupation = occupation
        self.nationality = nationality
        self.birth_date = birth_date
        self.residence = residence
        self.biography = biography

    def __str__(self):
        return f"Celebrity(id={self.id}, full_name='{self.full_name}', occupation='{self.occupation}', nationality='{self.nationality}', birth_date={self.birth_date}, residence='{self.residence}')"
