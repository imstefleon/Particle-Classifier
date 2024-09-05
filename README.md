# Particle Classification and Clustering Project

This repository contains code and resources for classifying and clustering particle data using various machine learning techniques. The project leverages libraries such as TensorFlow, Scikit-Learn, and Matplotlib to analyze particle behavior based on their characteristics.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Getting Started](#getting-started)
- [Methods](#methods)
- [Results](#results)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The goal of this project is to classify and cluster particle data to understand their behavior better. This is achieved through the application of various machine learning algorithms, including clustering methods like DBSCAN and classification techniques using neural networks.

## Dataset

The dataset used in this project consists of particle data with the following features:
- `Event`: Event identifier
- `Particula`: Particle type (e.g., deuterons, protons, kaons, pions, positrons)
- `Px`, `Py`, `Pz`: Momentum components
- `TPC`: Time Projection Chamber values
- `ITS`: Inner Tracking System values
- `Carga`: Charge of the particle

## Getting Started

To run the code in this repository, you need to have Python installed along with the required libraries. 

### Prerequisites

Make sure you have the following installed:
- Python 3.x
- pip (Python package installer)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
