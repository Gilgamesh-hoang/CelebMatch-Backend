import numpy as np

class PreprocessedObject:
    """
    A class to represent a preprocessed object containing bounding boxes and face data.

    Attributes:
        bounding_boxes (np.ndarray): An array of bounding boxes, where each bounding box is represented as a NumPy array.
        faces (list[np.ndarray]): A list of face data, where each face is represented as a NumPy array.
    """

    def __init__(self, bounding_boxes: np.ndarray = None, faces: list[np.ndarray] = None):
        """
        Initializes a PreprocessedObject instance.

        Args:
            bounding_boxes (np.ndarray, optional): An array of bounding boxes. Defaults to None.
            faces (list[np.ndarray], optional): A list of face data. Defaults to None.
        """
        self.bounding_boxes = bounding_boxes
        self.faces = faces