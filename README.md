# Tesis-Estefania: Particle Classification and Clustering Project

This repository contains code and resources for classifying and clustering particle data using various machine learning techniques, including integration with Kafka for data streaming. The project focuses on classifying particle behavior, including Pb-Pb (lead-lead) data, based on physical attributes such as momentum and charge.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Methods](#methods)
- [Results](#results)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The goal of this project is to develop models to classify and cluster various types of particles, including lead (Pb-Pb) data. We aim to:
- Develop machine learning models for particle classification.
- Perform clustering analysis using different algorithms (KMeans, DBSCAN, etc.).
- Integrate Kafka to handle data streaming and processing.
- Visualize results through various methods such as clustering plots and prediction accuracy.

## Dataset

The dataset used in this project consists of multiple data files that contain physical attributes of particles. Here’s a brief overview of the files:

- **PB-NEG.csv**: Final classified negative particle dataset.
- **PB-POS.csv**: Final classified positive particle dataset.
- **PBPRED.csv**: Predicted results for an incomplete dataset.
- **Plomo_neg**: Pb-Pb (lead-lead) negative data.
- **Plomo_pos**: Pb-Pb (lead-lead) positive data.
- **dataplomoPBPB.csv**: Original data file related to Pb-Pb particles positive and negative.

Each dataset includes the following key features:
- `Event`: Event identifier.
- `Particula`: Particle type (e.g., proton, pion, kaon, etc.).
- `Px`, `Py`, `Pz`: Momentum components in x, y, and z directions.
- `TPC`: Time Projection Chamber values.
- `ITS`: Inner Tracking System values.
- `Carga`: Particle charge.
- `Momento`: Total particle momentum, essential for studying particle motion.

## Methods

The following machine learning and clustering techniques are used:
1. **KMeans Clustering** (`C1-KMeans.ipynb`)
2. **Gaussian Mixture Models (GMM)** (`C2-Gaussian-NEG.ipynb` & `C2-GaussianPOS.ipynb`)
3. **DBSCAN Clustering** (`C3-DBSCAN.ipynb`)
4. **Spectral Clustering** (`C4-SpectralClustering.ipynb`)
5. **Curve Classifier** (`C6-Curves.ipynb`)
6. **Particle Classification with Kafka**: (`ParticleClassifierNEG.ipynb` and `ParticleClassifierPOS.ipynb`)

## Results

The results include clustering visualizations and classification accuracy reports for each model. Clustering groups particles based on their physical attributes (momentum, charge, etc.), while classification methods provide performance metrics on how well they identify different particle types.

## Getting Started

### Prerequisites

Make sure you have the following installed:
- Python 3.x
- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn
- tensorflow
- kafka-python
- Jupyter Notebook

You can install the required libraries via pip:

```bash
pip install pandas numpy matplotlib seaborn scikit-learn tensorflow kafka-python

