# Tesis-Estefania: Particle Classification and Clustering Project

This repository contains code and resources for classifying and clustering particle data using various machine learning techniques, with integration into Kafka for data streaming. The project focuses on classifying particle behavior, including Pb-Pb (lead-lead) data, based on physical attributes such as momentum and charge.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [TreeFilter](#treefilter)
- [Methods](#methods)
- [Results](#results)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The goal of this project is to develop models to classify and cluster various types of particles, including Pb-Pb (lead-lead) data. Objectives include:
- Developing machine learning models for particle classification.
- Performing clustering analysis using algorithms such as KMeans and DBSCAN.
- Integrating Kafka for data streaming and processing.
- Visualizing results through clustering plots and accuracy metrics.

## Dataset

The dataset consists of several files containing physical attributes of particles. Here’s a summary:

- **PB-NEG.csv**: Classified negative particle data.
- **PB-POS.csv**: Classified positive particle data.
- **PBPRED.csv**: Predicted results for an incomplete dataset.
- **Plomo_neg**: Pb-Pb (lead-lead) negative data.
- **Plomo_pos**: Pb-Pb (lead-lead) positive data.
- **dataplomoPBPB.csv**: Original Pb-Pb data, both positive and negative.

Key features in each dataset include:
- `Event`: Event identifier.
- `Particula`: Particle type (e.g., proton, pion, kaon).
- `Px`, `Py`, `Pz`: Momentum components in x, y, and z directions.
- `TPC`: Time Projection Chamber values.
- `ITS`: Inner Tracking System values.
- `Carga`: Particle charge.
- `Momento`: Total particle momentum.

## TreeFilter

The `treefilter.m` script filters both positive and negative particle datasets using primary detectors (TPC, ITS, TOF). The filtering process involves:
- **Filtering Criteria**:
  - Distance in X and Y directions from collision must be less than 2 mm.
  - Distance in Z direction must be less than 10 cm.
  - Valid TPC and ITS values (non-zero).
- **Dataset Separation**:
  - Splits into positive and negative datasets based on particle charge (`Carga`).

Functions used in filtering include:
- `filt(Particles)`: Filters data based on collision proximity and detector signals.
- `reduction(BD, Filtro)`: Extracts filtered data.
- `separate(BD, normal)`: Separates particles into positive and negative datasets.

## Methods

Machine learning and clustering techniques employed:
1. **KMeans Clustering** (`C1-KMeans.ipynb`)
2. **Gaussian Mixture Models (GMM)** (`C2-Gaussian-NEG.ipynb` & `C2-GaussianPOS.ipynb`)
3. **DBSCAN Clustering** (`C3-DBSCAN.ipynb`)
4. **Spectral Clustering** (`C4-SpectralClustering.ipynb`)
5. **Curve Classifier** (`C6-Curves.ipynb`)
6. **Particle Classification with Kafka** (`ParticleClassifierNEG.ipynb` & `ParticleClassifierPOS.ipynb`)

## Results

Results include clustering visualizations and classification accuracy reports for each model. Clustering groups particles based on physical attributes (momentum, charge), while classification methods provide performance metrics.

## Getting Started

### Prerequisites

Ensure you have the following installed:
- Python 3.x
- pandas
- numpy
- matplotlib
- seaborn
- scikit-learn
- tensorflow
- kafka-python
- Jupyter Notebook

Install the required libraries via pip:

```bash
pip install pandas numpy matplotlib seaborn scikit-learn tensorflow kafka-python


