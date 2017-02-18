bin/lightgbm config=lightgbm_kdd2012.conf adjacent_bundle=true data=data/kdd2012.train valid=data/kdd2012.test objective=binary metric=auc  2>&1 | tee lgb_kdd2012_accuracy_adjacent.log

bin/lightgbm config=lightgbm_kdd2012.conf adjacent_bundle=true data=data/kdd2012.train objective=binary metric=auc  2>&1 | tee lgb_kdd2012_speed_adjacent.log

bin/lightgbm config=lightgbm_kdd2010.conf adjacent_bundle=true data=data/kdd2010.train valid=data/kdd2010.test objective=binary metric=auc  2>&1 | tee lgb_kdd2010_accuracy_adjacent.log

bin/lightgbm config=lightgbm_kdd2010.conf adjacent_bundle=true data=data/kdd2010.train objective=binary metric=auc  2>&1 | tee lgb_kdd2010_speed_adjacent.log
