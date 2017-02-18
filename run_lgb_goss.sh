#run goss
run_goss() {
	post_fix="goss_"${1}"_"${2}
	adds="boosting_type=goss top_rate=0."${1}" other_rate=0."${2}

	bin/lightgbm config=lightgbm.conf $adds data=data/msltr.train objective=lambdarank 2>&1 | tee lgb_msltr_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/dataexpo.train objective=binary 2>&1 | tee lgb_dataexpo_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/allstate.train objective=binary num_leaves=127 learning_rate=0.02 2>&1 | tee lgb_allstate_speed_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/msltr.train valid=data/msltr.test objective=lambdarank metric=ndcg 2>&1 | tee lgb_msltr_accuracy_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/dataexpo.train valid=data/dataexpo.test metric=auc objective=binary 2>&1 | tee lgb_dataexpo_accuracy_${post_fix}.log
	bin/lightgbm config=lightgbm.conf $adds data=data/allstate.train valid=data/allstate.test metric=auc objective=binary num_leaves=127 learning_rate=0.02 2>&1 | tee lgb_allstate_accuracy_${post_fix}.log
}


for a in "05" "10" "15" "20" "25" "30"
do
	for b in "05" "10" "15" "20" "25" "30"
	do
		run_goss $a $b
	done
done
