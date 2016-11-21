# Gadget-Recommendation-Expert-System
Using CLIPS 


***************************************** MOBILE/TABLET/PHABLET Recommendation System ***************************


MEMBERS: Yashwant(IIT2014051),Parth Goel(IIT2014052),Paramjeet(IIT2014040),Preshit Gupta(IIT2014095),Bharat Gupta(IIT2014156)
PROJECT NAME: MOBILE/TABLET/PHABLET Recommendation System
PROJECT DESCRIPTION: This system recommends gadgets(MOBILE/TABLET/PHABLET) based on inputs a user enters.

Step 1 : Download and install the software CLIPS 6.30 from the link given here: https://sourceforge.net/projects/clipsrules/files/CLIPS/6.30/ .
------------------------------HOW TO RUN CODE------------------------------------------

Step 2 : Open the CLIPS 6.3 Dialog window which has been installed on the system.

Step 3 : A file name "Project.clp" is provided , which is a CLIPS File. Open this file in the dialog window by Shortcut Ctrl + O or by going File -> Open.

Step 4 : In the Menu Bar of CLIPS 6.3 Dialog window , Go to Buffer -> Load Buffer.

Step 5 : Then, in the menu  bar go to Execution -> Reset. 

Step 6 : Then, in the menu  bar go to Execution -> Run.

Now, If the inputs entered aren’t valid the system asks the user to enter a valid input and poses the question " Please enter a valid input as mentioned in the question! ".

The system only asks the questions which are most applicable based on the answer to the previous question.

After enough information is obtained to successfully recommend MOBILE/TABLET/PHABLET . The expert system displays that it recommends best.

Answer the questions as asked providing valid inputs

To help understand we have included an example execution of the program.


--------------------------------------------------------------------------------------------------------
------------------------ WELCOME TO THE SMARTPHONES / TABLETS / PHABLETS EXPERT ------------------------
--------------------------------------------------------------------------------------------------------

What do you want to buy? (mobile/tablet/phablet):  mobile

Let me select a Mobile suitable to buy in your budget...

Enter your preferred Price Range (under10k/ 10k-15k / 15k-25k / above25k):  15k-25k

Let me select a Mobile Phone in range 15K - 25K...

What is your preferred company? (oneplus/samsung/xiaomi):  oneplus

-------------------------------------------------------------------------------------------------------------------------------
The recommended Device which best suits your needs is: One Plus 2 (Rs. 19999/-)
-------------------------------------------------------------------------------------------------------------------------------

FILES USED:
Project.clp
README


HOW THE EXPERT SYSTEM WORKS ??? 

>> This is a RULE BASED EXPERT SYSTEM 

>> The strength of an ES derives from its KNOWLEDGE BASE - an organized collection of facts and heuristics about the system's domain. The accumulation of knowledge in knowledge bases, from which conclusions are to be drawn by the INFERENCE ENGINE, is the hallmark of an expert system.

>> THE INFERENCE ENGINE:

1. Combines the facts of a specific case with the knowledge contained in the knowledge base to come up with a recommendation. 
2. Directs the user interface to query the user for any information it needs for further inferencing.

Two strategies are:

1. Forward chaining - is a data-driven strategy. The inferencing process moves from the facts of the case to a goal (conclusion). The strategy is thus driven by the facts available in the working memory and by the premises that can be satisfied.
Forward-chaining systems are commonly used to solve more open-ended problems of a design or planning nature, such as, for example, establishing the configuration of a complex product.

2. Backward chaining - - the inference engine attempts to match the assumed (hypothesized) conclusion - the goal or subgoal state - with the conclusion (THEN) part of the rule. If such a rule is found, its premise becomes the new subgoal. In an ES with few possible goal states, this is a good strategy to pursue.
Backward chaining is best suited for applications in which the possible conclusions are limited in number and well defined. Classification or diagnosis type systems, in which each of several possible conclusions can be checked to see if it is supported by the data, are typical application

This is a Forward Chaining ES. 
