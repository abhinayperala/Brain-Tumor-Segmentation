# Brain Hemorrhage Segmentation 

## Objective
The aim of the "Brain Hemorrhage Detection" project is to create a mobile application that can identify and isolate brain hemorrhages by analyzing a series of images taken from brain CT scans. The application utilizes advanced techniques such as deep learning and machine learning and is developed using technologies such as Flutter, Firebase, Flask, and AWS. The goal is to offer precise and early detection of brain hemorrhages, facilitating prompt medical interventions and enhancing patients’ overall well-being.

## Technology Stack
- **Deep Learning:** Advanced algorithms for image segmentation.
- **Machine Learning:** Techniques to enhance precision.
- **Flutter:** Framework for cross-platform mobile application development.
- **Firebase:** Comprehensive development platform for authentication, real-time data synchronization, and cloud storage.
- **Flask:** Lightweight web framework for the backend server.
- **AWS (Amazon Web Services):** Cloud infrastructure for scalability and efficient deployment.

## Dataset Description
- **Source:** Kaggle, provided by Murtadha Hssayeni.
- **Content:** 2500 head CT images in jpg format, collected from 82 patients.
- **Focus:** Brain window images utilized for accurate identification and delineation of areas affected by intracranial hemorrhages.
- **Annotations:** A subset of 318 images accompanied by intracranial image masks serving as ground truth annotations.

## Model Description
- **Model:** U-Net, designed for image segmentation tasks.
- **Architecture:** Encoder-decoder convolutional neural network with skip connections.
- **Purpose:** Accurate detection and localization of intracranial hemorrhages.

## Front End Implementation (Flutter)
- **Features:** SplashPage, Login Page, Signup Page, OTP Page, and Results Page.
- **Integration:** Communicates with Flask application for brain hemorrhage segmentation.

## Firebase
- **Authentication:** Cloud Firestore for user data storage.
- **Storage:** Firebase Storage for securely uploading and storing output videos.
- **OTP Services:** Utilized for secure authentication and verification.

## Flask
- **Backend Server:** Handles video processing, frame extraction, and model-based segmentation.
- **Integration:** Communicates with Firebase Storage for storing processed videos.

## AWS (Amazon Web Services)
- **EC2 Instance:** Virtual server for deploying and operating applications.

## Horovod GPU Programming
- **Framework:** Accelerates distributed deep learning training using multiple GPUs.
- **Advantage:** Efficient scaling of model training by leveraging parallel processing capabilities.

## Procedure

### 1. Model Creation (U-Net)

#### a. Create U-Net Model:
- Use `unet.ipynb` to create the U-Net model.
- The notebook provides the architecture details and saves the trained model as `unet.hdf5`.

#### b. Training (Optional):
- If training is required, ensure you have the necessary dataset.
- Adjust hyperparameters in the notebook as needed.
- Train the model and save the weights as `unet.hdf5`.

### 2. Flutter App Execution

#### a. Install Dependencies:
- Ensure Flutter is installed on your development machine.
- Navigate to the Flutter app directory.

#### b. Run Flutter App:
- Execute the following command to run the Flutter app:
  ```bash
  flutter run
- The app should launch on your emulator or connected device.
### 3. Flask Backend Server
- Setup EC2 Instance (AWS):
-Create an EC2 instance on AWS.
-Connect to the instance using SSH.
-Install Dependencies:
-Install necessary dependencies on the EC2 instance:
-bash
-Copy code
```bash
 sudo apt update
 sudo apt install python3-pip
 pip3 install -r requirements.txt
```
-Run Flask App:
-Execute the following command to run the Flask app:
```bash
 python3 flask.py
```
-Flask app will be running on the specified port.
### 4. Firebase Setup:
-Firebase Authentication:
-Set up Firebase project and configure authentication.
-Obtain necessary API keys and configurations.
-Firebase Storage:
-Configure Firebase Storage for video storage.
-Obtain necessary credentials for Firebase Storage.
### 5. Integration:
-Update Flutter app and Flask app with Firebase credentials.
-Ensure communication between Flutter and Flask for video processing.
### 6. Run the Complete System:
-Start the Flask app on the EC2 instance.
-Run the Flutter app using flutter run.
-The complete system should now be operational for brain hemorrhage detection.

### 7. References :
-Dataset: https://www.kaggle.com/datasets/vbookshelf/computedtomography-ct-images
-U-NET: https://www.mdpi.com/2313-433X/7/12/269
-Flutter: https://docs.flutter.dev/
-Flutter Firebase Authentication: https://youtu.be/o_ZeLqpqt90
-ChatGPT (Debugging Tool): https://chat.openai.com/
-Flutter OTP Authentication: https://youtu.be/ftFNV6k0xBY
-Flask : https://flask.palletsprojects.com/en/2.3.x/
-Firebase: https://firebase.google.com/
-AWS: https://docs.aws.amazon.com/
-Hosting Flask Application on AWS: https://youtu.be/ct1GbTvgVNM
-Horovod GPU Programming: https://horovod.readthedocs.io/en/stable/summary_include.htm
