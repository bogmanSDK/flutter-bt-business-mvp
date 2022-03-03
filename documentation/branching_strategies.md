# BT Business

Main branching strategy for the project is a standard gitflow
>> http://datasift.github.io/gitflow/IntroducingGitFlow.html << 

Main points:
- master and develop are secured from the direct push, everything is pushed and merged via merge requests (pull requests)
- before MR/PR could be merged, all pipelines should be green (static analyzer should be happy, tests should be passed),
MR/PR should be reviewed and all discussions should be resolved 
- use rebase and squash where it's possible to provide a clear history
- feature/fix branch name should meet the following template:
 <keyword 'feature' or 'fix'>/<ticket number>-<ticket title>
e.g. 'feature/SME-47_Setup_project'
