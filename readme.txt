I. Author: Huy Huynh
II. Files:
	Main files:
	1. A2ClosedFormLinearRegression.m
        	+ Run Closed Form Linear Regression on x06Simple.csv data
        	+ 2/3 of the data is used for training, and the rest is for testing
        	+ Display final model string and RMSE
    	2. A2SFoldsCrossValidation.m
        	+ Run S Fold Cross Validation on x06Simple.csv data
        	+ Display average and standard deviation of RMSEs
	3. A2LocallyWeightedLinearRegression.m
        	+ Run Locally Weighted Linear Regression on x06Simple.csv data
        	+ 2/3 of the data is used for training, and the rest is for testing
        	+ Display RMSE
	4. A2GradientDescent.m
        	+ Run Gradient Descent on x06Simple.csv data
        	+ 2/3 of the data is used for training, and the rest is for testing
        	+ Display final model string and RMSE
	Supporting functions
	1. getFinalModelString.m
	2. getSimpleData.m
	3. getStandardizedData.m
	4. myClosedFormLinearRegression.m
	5. myGradientDescent.m
    	6. myLocallyWeightedLinearRegression.m
    	7. mySFoldsCrossValidation.m
    	8. randomizeData.m
    	9. splitData.m
III. Run files from MatLab GUI:
	1. Open the code directory in MatLab
	2. Select one of the main files specified above
	3. Click Run
III. Run files from Command Line:
	1. Make sure "matlab" is installed in command line environment
	2. cd to directory containing the files
	2. use command: matlab -nosplash -nodesktop -r "run('mainfilename.m');"
		Example: 
		matlab -nosplash -nodesktop -r "run('A2ClosedFormLinearRegression.m');"
		matlab -nosplash -nodesktop -r "run('A2SFoldsCrossValidation.m');"
		matlab -nosplash -nodesktop -r "run('A2LocallyWeightedLinearRegression.m');"
		matlab -nosplash -nodesktop -r "run('A2GradientDescent.m');"