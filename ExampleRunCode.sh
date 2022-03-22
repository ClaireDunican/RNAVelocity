#subn-directory of input
wd="/media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/"
#sub-directories for output
Main="/media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/Results"


eachfile="FA41146_Fatality_Metadata.csv" #Metadata file
sampname="FA41146_Fatality"
splicedName="Spliced250genes_${sampname}.csv"
unsplicedName="Unspliced250genes_${sampname}.csv"
mainmatrixName="MainMatrix250genes_${sampname}.csv"
ambiguousName="Ambiguous250genes_${sampname}.csv"

cd /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/
python3 /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/Code/Velocyto.py "7" $wd $splicedName $unsplicedName $mainmatrixName $ambiguousName /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/$eachfile /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/$eachfile "NoPCAVar" "Results/" "NoCoorelationCoeff" "False" "0.1" "euclidean" "/media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/Code/" "Strings" "False" "False" "Strings" "False" "False" "10" "True" "True" "True" "3" "2" "30" "1" $sampname

#to run it across a range of embedding number of neighbour values
for i in {2..30}; do python3 /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/Code/Velocyto.py $i $wd $splicedName $unsplicedName $mainmatrixName $ambiguousName /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/$eachfile /media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/ReducedSamplesELNET_715/$eachfile "NoPCAVar" "Results/" "NoCoorelationCoeff" "False" "0.1" "euclidean" "/media/claired/DATADRIVE2/FEAST/FateMapping/ForRNAV/Code/" "Strings" "False" "False" "Strings" "False" "False" "10" "True" "True" "True" "3" "2" "30" "1" $sampname; done

#parameters:
#1 is the number of neighbours/perplexity
#2 loction of the input files
#3 spliced transcript expression file
#4 unspliced transcript expression file
#5 main matrix expression file
#6 ambiguous expression file
#7 main metadata file with samples as first columan and Group as second ("Group" must be second column name) - used for colouts
#8 second metadata file of additional info - used for markers and/or as additional thing to look at trabsition probabilities over
#9 PCA variation based feature selection: NoPCAVar (do not run) or PCAVar (run this analysis)
#10 location of output dir (to be added to the end of the second parameter
#11 Do basic correlation coefficient based feature selection? NoCoorelationCoeff (do not run) or CoorelationCoeff (run this)
#12 apply scaling? (for vlm.calculate_embedding_shift* functions) False (do not do this) or True (do this)
#13 distance parameter for UMAP (currently set to the default)
#14 metric method used for UMAP parameter (currently set the default)
#15 location of the additional (R) code required for the transition probability work
#16 the "type" of (grouptype) first metadata i.e. are these "Strings" (classes) or "integers" (numeric timepoints)
#17 generate gif versions of UMAP3D, transiton probability scatterplots and 3D PCA? True (run this) or False (do not run this)
#18: true is "manyfeatures" - basically if your second ematadat file has useful classes to predict on then put as "True"
#19: "Strings": type of second feature is the final paramater (19)
#20: true is Randomsampling
#21: confidence interval calculation? (using first metadata: 7)) - "True" or "False"
#22: number of iterations for CI calculation - always an integer
#23: run tsne analsysi? "True" or "False"
#24: run UMAP analysis? "True" or "False"
#25: run 3d umap? "True" or "False" - if false then it will just run the 2d umap, has to be used in conjuncture witha true argument 24
#26: number of principal components to use for the pca! def: "3" - run as 2 or 3 - must be an integer
#27: beginning of the range for the transtion probability cloest number of neighbours value
#28: the end of a range for the transtion probability cloest number of neighbours value i.e. "2" at #27 and "11" at #28 would generate values between 2-10
#19: the interval over which the values transition probability number of neighbour values are used i.e. "1" would mean 1,2,3. "2" would mean 1 then 3
#20: the name of the output sub-directories into which the results of the analysis will be put






