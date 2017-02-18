bin/xgboost xgboost.conf tree_method=exact data="data/allstate.train" eval[test]="data/allstate.test" objective="binary:logistic" eval_metric=auc eta=0.02  max_depth=12 gamma=0.5 2>&1 | tee xgb_allstate_accuracy.log
bin/xgboost xgboost.conf tree_method=exact data="data/msltr.train" eval[test]="data/msltr.test" objective="rank:ndcg" eval_metric=ndcg@1 eval_metric=ndcg@3 eval_metric=ndcg@5 eval_metric=ndcg@10 max_depth=16 2>&1 | tee xgb_msltr_accuracy.log
bin/xgboost xgboost.conf tree_method=exact data="data/dataexpo.train" eval[test]="data/dataexpo.test" objective="binary:logistic" eval_metric=auc max_depth=12 gamma=60 2>&1 | tee xgb_dataexpo_accuracy.log


bin/xgboost xgboost.conf tree_method=exact data="data/allstate.train"  objective="binary:logistic"  eta=0.02  max_depth=12  gamma=0.5  2>&1 | tee xgb_allstate_speed.log
bin/xgboost xgboost.conf tree_method=exact data="data/msltr.train"  objective="rank:ndcg" max_depth=16 2>&1 | tee xgb_msltr_speed.log
bin/xgboost xgboost.conf tree_method=exact data="data/dataexpo.train" objective="binary:logistic"  max_depth=12 gamma=60 2>&1 | tee xgb_dataexpo_speed.log


bin/xgboost xgboost.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=127 data="data/allstate.train" eval[test]="data/allstate.test" objective="binary:logistic" eval_metric=auc eta=0.02 2>&1 | tee xgbhist_allstate_accuracy.log
bin/xgboost xgboost.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/msltr.train" eval[test]="data/msltr.test" objective="rank:ndcg" eval_metric=ndcg@1 eval_metric=ndcg@3 eval_metric=ndcg@5 eval_metric=ndcg@10 2>&1 | tee xgbhist_msltr_accuracy.log
bin/xgboost xgboost.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/dataexpo.train" eval[test]="data/dataexpo.test" objective="binary:logistic" eval_metric=auc 2>&1 | tee xgbhist_dataexpo_accuracy.log



bin/xgboost xgboost.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=127 data="data/allstate.train" objective="binary:logistic" eta=0.02 2>&1 | tee xgbhist_allstate_speed.log
bin/xgboost xgboost.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/msltr.train" objective="rank:ndcg"  2>&1 | tee xgbhist_msltr_speed.log
bin/xgboost xgboost.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/dataexpo.train" objective="binary:logistic" 2>&1 | tee xgbhist_dataexpo_speed.log

