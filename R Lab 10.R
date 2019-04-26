

# Bayesian Belief networks

install.packages("bnlearn")
package(bnlearn)


#using the coronary dataset
data(coronary)

#learning the structure of the data

bn_df <- data.frame(coronary)
res <- hc(bn_df)
plot(res)

#modifying derived structure - on running the below line, the link that goes from M..work to family will be deleted
res$arcs <- res$arcs[-which((res$arcs[,'from'] == "M..Work" &
                               res$arcs[,'to'] == "Family")),]

#training our model
fittedbn <- bn.fit(res, data=bn_df)

#Inferring from our bayesian network - telling probability of the below query
cpquery(fittedbn, event = (Proteins=="<3"), evidence =
          (Smoking=="no" & Pressure==">140"))


## Part 2 - Hidden Markov Model ( HMM )

# Required Library
library(depmixS4)

# Loading the data
physician_prescription_data <- c(12,16,45,45,56,67,78,98,10,124,156)

# Executing the model
HMM_model <- depmixS4::depmix(physician_prescription_data~1,
                              nstates = 2, ntimes=length(physician_prescription_data))

# Fitting the model
HMM_fm <- fit(HMM_model)

#Transition probabilities
HMM_fm@transition

# Posterior states
posterior(HMM_fm)
plot(ts(posterior(HMM_fm)[,1]))

# Emission probabilities
HMM_fm@response
