import numpy as np


class PreprocessedObject:
    """
    A class to represent a preprocessed model.
    """

    def __init__(self, bounding_boxes: np.ndarray = None, faces: list[np.ndarray] = None):
        self.bounding_boxes = bounding_boxes
        self.faces = faces
