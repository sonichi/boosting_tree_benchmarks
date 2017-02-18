#run rand
run_rand() {
	post_fix="rand_"${1}
	adds="bagging_freq=1 bagging_fraction=0."${1}

	bin/lightgbm config=lightgbm.conf $adds data=data/msltr.train objective=lambdarank 2>&1 | tee lgb_msltr_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/yahoo.train objective=lambdarank 2>&1 | tee lgb_yahoo_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/dataexpo.train objective=binary 2>&1 | tee lgb_dataexpo_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/allstate.train objective=binary num_leaves=127 learning_rate=0.02 2>&1 | tee lgb_allstate_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/msltr.train valid=data/msltr.test objective=lambdarank metric=ndcg 2>&1 | tee lgb_msltr_accuracy_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/yahoo.train valid=data/yahoo.test objective=lambdarank metric=ndcg 2>&1 | tee lgb_yahoo_accuracy_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/dataexpo.train valid=data/dataexpo.test metric=auc objective=binary 2>&1 | tee lgb_dataexpo_accuracy_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/allstate.train valid=data/allstate.test metric=auc objective=binary num_leaves=127 learning_rate=0.02 2>&1 | tee lgb_allstate_accuracy_${post_fix}.log
}

for b in "05" "10" "15" "20" "25" "30" "35" "40" "45" "50" "55" "60"
do
	run_rand $b
done

