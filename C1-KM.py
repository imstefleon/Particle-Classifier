#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt

# Cargar el conjunto de datos collisiones PB PB Positivos
data = pd.read_csv("Plomo_pos")  

# Seleccionar las columnas relevantes (TOF y Momento)
X = data[['TPC', 'Momento']]

# Normalizar los datos
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Aplicar K-Means
kmeans = KMeans(n_clusters=5)  # Especifica el número de clusters deseado
kmeans.fit(X_scaled)

# Obtener las etiquetas de los clusters
labels = kmeans.labels_

# Añadir las etiquetas de los clusters al dataframe original
data['Cluster'] = labels

# Seleccionar las columnas relevantes para el nuevo archivo CSV
output_data = data[['Event', 'Particula', 'Px', 'Py', 'Pz', 'Carga', 'Cluster']]

# Exportar el nuevo dataframe a un archivo CSV
output_data.to_csv("PB-Pos-C1.csv", index=False)

# Visualizar los resultados
plt.scatter(X['Momento'], X['TPC'], c=labels, cmap='viridis')
plt.xlabel('TPC')
plt.ylabel('Momento')
plt.title('Clustering de Partículas con K-Means')
plt.colorbar(label='Cluster')

# Establecer límites en los ejes x e y
plt.ylim(0, 700)
plt.xlim(0, 5)

plt.show()


# In[2]:


import pandas as pd
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt

# Cargar el conjunto de datos collisiones PB PB Negativos
data = pd.read_csv("Plomo_neg")  

# Seleccionar las columnas relevantes (TOF y Momento)
X = data[['TPC', 'Momento']]

# Normalizar los datos
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

# Aplicar K-Means
kmeans = KMeans(n_clusters=5)  # Especificar el número de clusters deseado
kmeans.fit(X_scaled)

# Obtener las etiquetas de los clusters
labels = kmeans.labels_

# Añadir las etiquetas de los clusters al dataframe original
data['Cluster'] = labels

# Seleccionar las columnas relevantes para el nuevo archivo CSV
output_data = data[['Event', 'Particula', 'Px', 'Py', 'Pz', 'Carga', 'Cluster']]

# Exportar el nuevo dataframe a un archivo CSV
output_data.to_csv("PB-Neg-C1.csv", index=False)

# Visualizar los resultados
plt.scatter(X['Momento'], X['TPC'], c=labels, cmap='viridis')
plt.xlabel('TPC')
plt.ylabel('Momento')
plt.title('Clustering de Partículas con K-Means')
plt.colorbar(label='Cluster')

# Establecer límites en los ejes x e y
plt.ylim(0, 700)
plt.xlim(0, 5)

plt.show()


# In[ ]:




