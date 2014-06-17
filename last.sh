#!/bin/sh

# 定数取得
date=`date +%Y/%m/%d`
num=$(echo "$1"|sed "s/[a-z\.]//g")
scriptfile="tmp"
scriptfile2="tmp2"

# scriptで出来るゴミを削除
sed -i "1,2d" $scriptfile
i=1
while [ $i -le 5 ];
do
	sed -i '$d' $scriptfile
	i=`expr $i + 1`
done

# ゴミ削除後の行数を取得
wcnum=$(grep -c '' $scriptfile)
wcnum=`expr ${wcnum} + 1`

# scriptfileに一旦書き出す
sed -i "1i /* \\" $scriptfile
sed -i "2i * プログラムの動作例\\" $scriptfile
wcnum=`expr ${wcnum} + 1`
sed -i "3,${wcnum}s/^/ \* /" $scriptfile
sed -i "${wcnum}a   \*\/" $scriptfile

tr -d '' < $scriptfile > $scriptfile2

# 感想を読み取る
echo "感想を入力してください"
echo -n "感想:"
read comment

# 一番頭に書く物を入力
sed -i "1i /* \\" $1
sed -i "2i  * 課題$num \\ " $1
sed -i "3i  * 提出日 $date \\" $1
sed -i "4i  * 学籍番号 1310 \\" $1
sed -i "5i  * 氏名  \\" $1
sed -i "6i  * 感想: $comment \\" $1
sed -i "7i  */ \\" $1

# 一旦書き出したファイルをソースコードに入力する
cat $scriptfile2 >> $1

# ゴミはゴミ箱に
rm -f $scriptfile $scriptfile2

# 完成したソースコード確認
cat $1
