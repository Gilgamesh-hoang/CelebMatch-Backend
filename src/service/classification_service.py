import pickle
import numpy as np
from sklearn.ensemble import RandomForestClassifier
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
        self.model: RandomForestClassifier = self.load_model()  # Load the classification model.

    def load_model(self) -> RandomForestClassifier:
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
                    probability=float(probabilities[i][label-1])  # Get the probability for the predicted class.
                )
            )

        # Return the list of prediction results.
        return results
