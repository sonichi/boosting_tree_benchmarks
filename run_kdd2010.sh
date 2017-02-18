bin/lightgbm config=lightgbm_kdd2010.conf enable_bundle=false data=data/kdd2010.train valid=data/kdd2010.test objective=binary metric=auc  2>&1 | tee lgb_kdd2010_accuracy_old.log

bin/lightgbm config=lightgbm_kdd2010.conf enable_bundle=false data=data/kdd2010.train objective=binary metric=auc  2>&1 | tee lgb_kdd2010_speed_old.log

run_mefb(){
	add="max_conflict_rate=0."${1}
	postfix="mcr_"${1}

	bin/lightgbm config=lightgbm_kdd2010.conf ${add} data=data/kdd2010.train valid=data/kdd2010.test objective=binary metric=auc  2>&1 | tee lgb_kdd2010_accuracy_${postfix}.log

	bin/lightgbm config=lightgbm_kdd2010.conf ${add} data=data/kdd2010.train objective=binary metric=auc  2>&1 | tee lgb_kdd2010_speed_${postfix}.log
}

run_goss(){

	post_fix="goss_"${1}"_"${2}
	adds="boosting_type=goss top_rate=0."${1}" other_rate=0."${2}

	bin/lightgbm config=lightgbm_kdd2010.conf $adds max_conflict_rate=0 data=data/kdd2010.train valid=data/kdd2010.test objective=binary metric=auc  2>&1 | tee lgb_kdd2010_accuracy_${post_fix}.log

	bin/lightgbm config=lightgbm_kdd2010.conf $adds max_conflict_rate=0 data=data/kdd2010.train objective=binary 2>&1 | tee lgb_kdd2010_speed_${post_fix}.log
}

run_mefb 0

for a in "5" "10" "20" "30" 
do
	for b in "5" "10" "20" "30"
	do
		run_goss $a $b
	done
done