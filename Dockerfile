# syntax=docker/dockerfile:1
FROM python:3.8
WORKDIR /face-mesh-mediapipe
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 -y
COPY ./requirements.txt /face-mesh-mediapipe/requirements.txt
RUN  pip install -r requirements.txt
COPY . .
CMD ["streamlit", "run","face_mesh_app.py","--server.port","8080"]
EXPOSE 8080