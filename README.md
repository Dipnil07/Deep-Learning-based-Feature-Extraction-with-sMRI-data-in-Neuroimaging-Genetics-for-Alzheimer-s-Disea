# Deep-Learning-based-Feature-Extraction-with-sMRI-data-in-Neuroimaging-Genetics-for-Alzheimer's-Disease
In this paper, the authors propose a method of finding genetic varinats responsible for the Alzheimer's Disease with the help of features derived from the Magnetic Resonance Images (MRI) obtained from Alzheimer's Disease Neuroimaging Initiative (ADNI) database. As a result, the analysis is primarily divided in two parts. Firstly, we used a convolution neural network (CNN) model to perform an automatic extraction from the MRI images. This part of the coding has been done using Python in Jupyter notebook. For the second part, we used regression models to find the genetic variants responsible for the ALzheimers Disease.

Part I (Convolution Neural Network in Python): 

For the convolutional neural network, we have followed two approaches. The first one is with respect to whole brain images and the second one is by dividing the image in 27 sub-patches of 3d images. The whole brain image analysis of code can be found in Whole_image_classification_final.ipynb. I will encourage the users to change the parameters and re-run the code to understand how different parametrs impact the training time and model performance.

In the file Spe_branches_final_Augmented.ipynb, you can find the code for image augmentation. Image augmentation has been used to address the over-fitting issue caused by small sample size in this problem.

In Spe_branches_final.ipynb, one can find the code for implementing the multi-branch modelling. A section of the code has been developed to train the 27 small images and comparing their validation accuracy. In the second part the top five model/patches, have been used to develop the final model.

All of these classification models have been have been developed to perform a feature extraction step. Once we extract these features, they can be used as inputs for individual patients in a regression model to perform the sub-sequent Gene Wide Association Studies. 


The models take a long time to run. It will be advisable to compile these codes at a small scale and then run it for all the images. 



Part II (Regression model for the genetics model):


These part of the codes have been prepared in R programming language. The extracted features from the individual patients are combined with their available Genetic data. Then, we have used a simple linear regression method to identify the most important SNPs and relevant Genes. The point that makes this study novel in the literature of neuroimaging and genetic studies is that we have attempted for an automated methos of feature extraction instead of using just a few pre-selected brain atlases for the purpose of the genetic study. That is the uniqueness of this study and in future the authors want to explore the use of a combination of more advanced GWAS algorithms to find novel as well as known genes.


The published codes have been prepared with respect to ADNI1 data. The dataset can be used and downloaded from ADNI-LONI website following a simple request. The details can be found here: https://adni.loni.usc.edu/data-samples/access-data/ 





