spark-submit ^
    --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.5 ^
    --conf "spark.driver.extraClassPath=/Users/rcfor/dev/tools/ignite/libs/*:/home/rcforte/dev/tools/ignite/libs/ignite-indexing/*:/home/rcforte/dev/tools/ignite/libs/ignite-log4j/*:/home/rcforte/dev/tools/ignite/libs/ignite-scalar/*:/home/rcforte/dev/tools/ignite/libs/ignite-spark-2.4/*:/home/rcforte/dev/tools/ignite/libs/ignite-spring/*:/home/rcforte/dev/tools/ignite/libs/licenses/*" ^
    --conf "spark.executor.extraClassPath=/Users/rcfor/dev/tools/ignite/libs/*:/home/rcforte/dev/tools/ignite/libs/ignite-indexing/*:/home/rcforte/dev/tools/ignite/libs/ignite-log4j/*:/home/rcforte/dev/tools/ignite/libs/ignite-scalar/*:/home/rcforte/dev/tools/ignite/libs/ignite-spark-2.4/*:/home/rcforte/dev/tools/ignite/libs/ignite-spring/*:/home/rcforte/dev/tools/ignite/libs/licenses/*" app.py

