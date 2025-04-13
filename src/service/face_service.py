import numpy as np
import tensorflow as tf

import src.face_recognition.facenet as facenet
import src.utils.constant as constant


def prewhiten_batch(images: list[np.ndarray]) -> np.ndarray:
    """
    Applies the prewhiten operation to each image in the list and returns them as a single NumPy array.

    Args:
        images (list[np.ndarray]): A list of images represented as NumPy arrays.

    Returns:
        np.ndarray: A single NumPy array containing the prewhitened images.
    """
    # Apply the prewhiten function to each image in the list.
    prewhitened_images = [facenet.prewhiten(img) for img in images]
    # Stack the prewhitened images into a single NumPy array.
    return np.stack(prewhitened_images)


def get_embeddings(images_data: list[np.ndarray]) -> list[np.ndarray]:
    """
    Computes embeddings for a list of images using the FaceNet model.

    Args:
        images_data (list[np.ndarray]): A list of images represented as NumPy arrays.

    Returns:
        list[np.ndarray]: A list of embeddings for the input images.
    """
    # Create a new TensorFlow graph and session.
    with tf.Graph().as_default():
        # Configure GPU options to limit memory usage.
        gpu_options = tf.compat.v1.GPUOptions(per_process_gpu_memory_fraction=0.6)
        sess = tf.compat.v1.Session(
            config=tf.compat.v1.ConfigProto(gpu_options=gpu_options, log_device_placement=False)
        )

        with sess.as_default():
            # Load the FaceNet model from the specified path.
            facenet.load_model(constant.FACENET_MODEL_PATH)

            # Retrieve the required tensors from the loaded model.
            images_placeholder = tf.compat.v1.get_default_graph().get_tensor_by_name("input:0")
            embeddings = tf.compat.v1.get_default_graph().get_tensor_by_name("embeddings:0")
            phase_train_placeholder = tf.compat.v1.get_default_graph().get_tensor_by_name("phase_train:0")

            # Preprocess all images in the batch by applying prewhiten.
            prewhitened_images = prewhiten_batch(images_data)
            # Reshape the images to match the input size of the model.
            reshaped = prewhitened_images.reshape(-1, constant.INPUT_IMAGE_SIZE, constant.INPUT_IMAGE_SIZE, 3)

            # Run the model to compute embeddings for the input images.
            feed_dict = {images_placeholder: reshaped, phase_train_placeholder: False}
            embeddings_list = sess.run(embeddings, feed_dict=feed_dict)

        # Close the TensorFlow session.
        sess.close()

        # Return the computed embeddings.
        return embeddings_list
