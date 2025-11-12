
=================
Getting Started
=================

We have included a few options to learn how to get started with this pipeline.

Google Collab
~~~~~~~~~~~~~~~~~~~~~~

A Google Colab notebook was created to provide guidance on how to complete this entire end-to-end ML pipeline. 
It guides you through every step of the pipeline from environment creation to verifiying a forecast. 
You are able to run it with free resources on a T4 GPU. It is also compatible with paid resources (A-100) if that is available to you. 
It is possible to run this on a CPU, but it will take a very long time. If you wish to run on a CPU consider training the model for only a couple of steps. 
This notebook is designed to train a model on a very small amount of data; therefore, it is not expected to produce 
meaningful or physical results. Its main purpose is to demonstrate the entire pipeline and guide users to understand 
the workflow from start to finish and sucessfully complete each step.

Train a Small Model with NOAA-Replay Data
~~~~~~~~~~~~~~~~~~~~~~

This option is considered a next step from the Google Colab notebook. 
It provides a more official set-up that can run the entire pipeline on a HPC machine using slurm or in AzureML using Command jobs. 
This version trains a model using 1 year of NOAA-Replay reanalysis data, which offers a more realisitc example 
of how the full system operates and is deployed in practice. 
These results are still not expected to be meaninful or look physical, but this serves as a great next step in learning the full pipeline 
in a more scalable setting.
