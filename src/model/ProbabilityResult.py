from pydantic import BaseModel


class ProbabilityResult:
    """
    Represents the probability of a specific class in a classification result.
    """

    def __init__(self, class_id: int, probability: float):
        """
        Initializes a ProbabilityResult instance.

        Args:
            class_id (int): The ID of the class.
            probability (float): The probability of the class (value between 0 and 1).
        """
        self.class_id = class_id  # The class ID.
        self.probability = probability  # The probability of the class.

    def __str__(self):
        return f"Lớp {self.class_id} (Xác suất: {self.probability:.4f})"


class PredictionResult:

    """
    Represents the prediction result, including the predicted class and top probabilities.
    """

    def __init__(self, predict_class: int, probabilities: list[ProbabilityResult]):
        """
        Initializes a PredictionResult instance.

        Args:
            predict_class (int): The predicted class ID.
            probabilities (list[ProbabilityResult]): A list of ProbabilityResult objects for the top classes.
        """
        self.predict_class = predict_class  # The predicted class ID.
        self.probabilities = probabilities  # A list of top ProbabilityResult objects.

    def __str__(self):
        # Format the probabilities as a string.
        probs_str = "\n    ".join(str(prob) for prob in self.probabilities)
        return f"Dự đoán: Lớp {self.predict_class}\nTop-2 lớp có xác suất cao nhất:\n    {probs_str}"
