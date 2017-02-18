bin/xgboost xgboost_kdd2010.conf tree_method=exact data="data/kdd2010.train" eval[test]="data/kdd2010.test" objective="binary:logistic" eval_metric=auc  2>&1 | tee xgb_kdd2010_accuracy.log


bin/xgboost xgboost_kdd2012.conf tree_method=exact data="data/kdd2012.train" eval[test]="data/kdd2012.test" objective="binary:logistic" eval_metric=auc  2>&1 | tee xgb_kdd2012_accuracy.log


bin/xgboost xgboost_kdd2012.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/kdd2012.train" eval[test]="data/kdd2012.test" objective="binary:logistic" eval_metric=auc  2>&1 | tee xgbhist_kdd2012_accuracy.log
bin/xgboost xgboost_kdd2012.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/kdd2012.train" objective="binary:logistic" 2>&1 | tee xgbhist_kdd2012_speed.log

bin/xgboost xgboost_kdd2010.conf tree_method=exact data="data/kdd2010.train" objective="binary:logistic" 2>&1 | tee xgb_kdd2010_speed.log
bin/xgboost xgboost_kdd2012.conf tree_method=exact data="data/kdd2012.train" objective="binary:logistic" 2>&1 | tee xgb_kdd2012_speed.log

bin/xgboost xgboost_kdd2010.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/kdd2010.train" eval[test]="data/kdd2010.test" objective="binary:logistic" eval_metric=auc  2>&1 | tee xgbhist_kdd2010_accuracy.log
bin/xgboost xgboost_kdd2010.conf max_bin=255 tree_method=hist grow_policy=lossguide max_depth=0 max_leaves=255 data="data/kdd2010.train" objective="binary:logistic" 2>&1 | tee xgbhist_kdd2010_speed.log
