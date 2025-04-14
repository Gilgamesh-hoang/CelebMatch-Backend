import pickle
import numpy as np

from src.model.ProbabilityResult import ProbabilityResult, PredictionResult
from src.utils.constant import CLASSIFICATION_MODEL_PATH


class ClassificationService:
    """
    A service class for loading a classification model and predicting class labels and probabilities.
    """

    def __init__(self):
        """
        Initializes the ClassificationService by loading the classification model.
        """
        self.model = self.load_model()  # Load the classification model.

    def load_model(self):
        """
        Loads the classification model from the specified file path.

        Returns:
            The loaded classification model.
        """
        with open(CLASSIFICATION_MODEL_PATH, 'rb') as file:
            model = pickle.load(file)  # Load the model using pickle.
        print(f"Mô hình đã được tải từ {CLASSIFICATION_MODEL_PATH}")  # Log the model loading.
        return model

    def predict(self, embeddings: np.ndarray) -> list[ProbabilityResult]:
        """
        Predicts class labels and probabilities for the given embeddings.

        Args:
            embeddings (np.ndarray): A NumPy array of embeddings.

        Returns:
            list[ProbabilityResult]: A list of ProbabilityResult objects containing predicted class IDs and probabilities.
        """
        # Ensure embeddings are in NumPy array format.
        embeddings = np.array(embeddings)

        # Predict class labels for the embeddings using the loaded model.
        predictions = self.model.predict(embeddings)

        # Get the probabilities for each class using the model.
        probabilities = self.model.predict_proba(embeddings)

        # Create a list to store the prediction results.
        results = []
        for i in range(len(embeddings)):
            # Get the predicted class label for the current embedding.
            label = predictions[i]
            # Append a ProbabilityResult object with the class ID and its probability.
            results.append(
                ProbabilityResult(
                    class_id=int(label),  # Convert the class ID to an integer.
                    probability=float(probabilities[i][label])  # Get the probability for the predicted class.
                )
            )

        # Return the list of prediction results.
        return results

    # def predict(self, embeddings: np.ndarray):
    #     """
    #     Predicts class labels and probabilities for the given embeddings.
    #
    #     Args:
    #         embeddings (np.ndarray): A NumPy array of embeddings.
    #
    #     Returns:
    #         list[PredictionResult]: A list of PredictionResult objects containing predicted classes and probabilities.
    #     """
    #     # Ensure embeddings are in NumPy array format.
    #     embeddings = np.array(embeddings)
    #
    #     # Predict class labels for the embeddings.
    #     predictions = self.model.predict(embeddings)
    #
    #     # Get the probabilities for each class.
    #     probabilities = self.model.predict_proba(embeddings)
    #
    #     # Create a list to store the prediction results.
    #     results = []
    #     for i in range(len(embeddings)):
    #         # Get the probabilities for the current sample.
    #         probs = probabilities[i]
    #         # Sort the classes by probability in descending order and get the top-2 indices.
    #         top_2_indices = np.argsort(probs)[-2:][::-1]  # Top-2 indices (descending order).
    #         top_2_probs = probs[top_2_indices]  # Corresponding probabilities.
    #
    #         # Create a list of ProbabilityResult objects for the top-2 classes.
    #         probabilities_list = [
    #             ProbabilityResult(class_id=int(top_2_indices[0]), probability=float(top_2_probs[0])),
    #             ProbabilityResult(class_id=int(top_2_indices[1]), probability=float(top_2_probs[1]))
    #         ]
    #
    #         # Create a PredictionResult object for the current sample.
    #         result = PredictionResult(predict_class=int(predictions[i]), probabilities=probabilities_list)
    #         results.append(result)  # Add the result to the list.
    #
    #     return results  # Return the list of prediction results.
