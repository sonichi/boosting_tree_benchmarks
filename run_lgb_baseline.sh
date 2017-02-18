#run baseline

bin/lightgbm config=lightgbm.conf data=data/msltr.train objective=lambdarank 2>&1 | tee lgb_msltr_speed.log
bin/lightgbm config=lightgbm.conf data=data/dataexpo.train objective=binary 2>&1 | tee lgb_dataexpo_speed.log
bin/lightgbm config=lightgbm.conf data=data/allstate.train objective=binary num_leaves=127 learning_rate=0.02 2>&1 | tee lgb_allstate_speed.log
bin/lightgbm config=lightgbm.conf data=data/msltr.train valid=data/msltr.test objective=lambdarank metric=ndcg 2>&1 | tee lgb_msltr_accuracy.log
bin/lightgbm config=lightgbm.conf data=data/dataexpo.train valid=data/dataexpo.test metric=auc objective=binary 2>&1 | tee lgb_dataexpo_accuracy.log
bin/lightgbm config=lightgbm.conf data=data/allstate.train valid=data/allstate.test metric=auc objective=binary num_leaves=127 learning_rate=0.02 2>&1 | tee lgb_allstate_accuracy.log
