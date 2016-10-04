# RIOT TEXT ANALYSIS


## PART 1 : DATA SCRAPING

### Language & Data Structure
* Scripting Language : `Python 3`
* Tokenizing Texts : `nltk` library for `Python`
* Output Format : `csv`

### Tasks
1. Read articles into the workspace
2. Parse the whole text into words
3. Process all words by stemming them with `nltk` library
4. Among processed words, discard common words and gibberish
5. Concatenate processed word sets from each articles into one csv file
6. Further trimming of word set


## PART 2 : FEATURE EXTRACTION

### Language & Data Structure
* Scripting Language : `Python 3`
* Cross Validation : `R`
* Simple Linear Classifier : `R`
* Output Format : `csv`

### Tasks
1. Iterate though all training set to record occurrence of processed words
2. Perform cross validation with simple linear classifier on features
3. Select best 1000~ features
4. Add label to each records and output as csv file


## PART 3 : MODEL SELECTION

### Language & Data Structure
* Scripting Language : `R`
* Learning Models : `R`
* Output Format : `Rdata`

### Models In Use
* Multinomial Logistic Regression
* Linear Discriminant Analysis
* Support Vector Machine
* Random Forest
* K-Nearest Neighbor

### Tasks
1. With training set created in PART 2, create prediction models with each models
2. Output created models in `RData` format


## PART 4 : PARAMETERS SELECTION

### Language & Data Structure
* Scripting Language : `R`
* Learning Models : `R`
* Cross Validation : `R`
* Output Format : `Rdata`

### Tasks
1. Perform cross validation on model parameters for each models
2. Output created models in `RData` format


## PART 5 : PREDICTION & CLASSIFICATION

### Language & Data Structure
* Scripting Language : `R`
* Output Format : `csv`

### Tasks
1. Perform prediction with models from `RData` files
2. Output prediction result into `csv` file
3. Feedback


## PART 6 : EXTRA INFORMATION EXTRACTION

### Language & Data Structure
* TO BE ADDED

### Tasks
* TO BE ADDED
