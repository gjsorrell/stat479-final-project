# stat479-final-project

* To replicate computation steps, download projectCHTC folder or projectCHTC.tar

Run "condor_submit_dag submit.dag" to get "merge.tsv"
git clone git@github.com:gjsorrell/stat479-final-project.git

 (pre 1)  pre.sh
              |
              V
 (job 1)  job.sub
            / | \
   13 parallel runs of job.sh (job.R)
            \ | /
              V
 (post 1) merge.sh
 
 
After CHTC, you need to run report.Rmd to get results of models.

* To replicate report, download report folder
