# BB_test

This is a model of bowerbird male mating behavior known as maruading, whereby males destroy other males' mating structures known as bowers. By destroying their neighbor's bowers, they supposedly enhance their own mating success, and we wanted to identify under what conditions this behavior can be understood as an evolutionary stable strategey (ESS).

[Pruett-Jones and Pruett-Jones 1994](https://reader.elsevier.com/reader/sd/pii/S0003347284710840?token=201E6C798DAE805794AD572EC22E11BF6E35C5023F7EE9B1B1692F99995C1816A22670E91D26B4C0A81E4EEB094C0BD5&originRegion=us-east-1&originCreation=20211007152310) formed and algabriac game theory model that found maruading was an ESS under biologically realsitic parameters. However, this paper dealt with only two males. We were interested to see how the benefit of marauding varied as a frequency dependent strategy in a spatial world.

Therefore, we created an agent based model, exploring the following conditions in a factorial manner:

 * **number of males** 2, 4, 6, 8, 12, and 24 males
 * **spatial configuration** Aspatial (all males equidistant), uniform, scrambled
 * **number of marauders:** 0 to n-1 males


Males were distinct agents. They were assigned an ID, a marauder or guarder status, a probability of marauding (P-mar) and physical location. The figure below shows an example of a spatial world with 6 males. In this example, a marauder travels to a male’s bower while the other male is foraging. Since the bower of the foraging bird is left unguarded, the marauder successfully marauds and then returns to his own bower (MR). When the foraging bird returns, he sees his bower is in disrepair and therefore must repair his bower. The bottom right of this figure shows female vistiation. A female starts at the location of a random male before choosing the first male to visit. She visits her first male (1) but cannot mate since he is foraging. She visits another male (2) but cannot mate because his bower is not intact. She then visits a final male (3) who meets the conditions of being present at an intact bower, so she mates successfully with him.



 
<img width="624" alt="Screen Shot 2021-10-07 at 8 40 42 AM" src="https://user-images.githubusercontent.com/40371336/136418130-632e5f78-18d5-4f13-a0c0-8b17ed51dcca.png">

Here is a diagram of transitions between the actions. Probability distributions or set times were used to determine how long a bird remained doing one action before moving on to another. In addition, there was a decision tree process that occured when birds were in the transition state, which determined whether they would forage, repair their bower, maraud, or stay at the bower.

<img width="606" alt="Screen Shot 2021-10-07 at 8 44 38 AM" src="https://user-images.githubusercontent.com/40371336/136418799-79454fe8-b7ad-4993-9881-410f9d2269fb.png">

The two figures above provide a visual depiction of our model. Actual code was done in Python can be found in the repository. We then ran seeded simulations with 1,000 males, submitting batch files to Midway2 computing cluster and creating CSV files we could then analyze in R. In R, we performed t-tests and performed a regression analysis. Code for the model in Python and R analysis files can all be found in this repository. Uploading the CSV files for all conditions is currently in progress.

