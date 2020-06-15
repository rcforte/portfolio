from pyspark.sql import SparkSession

if __name__ == '__main__':
  # setup the spark session
  spark = SparkSession\
    .builder\
    .appName('portfolio-analytics')\
    .getOrCreate()
  spark.sparkContext.setLogLevel('WARN')

  # setup the dataframe
  df = spark\
    .readStream\
    .format('kafka')\
    .option('kafka.bootstrap.servers', 'localhost:9092')\
    .option('subscribe', 'portfolio-analytics-input')\
    .load()

  # tranform the dataframe and write the data back to the stream
  query = df.selectExpr('cast(key as string)', 'cast(value as string)')\
    .writeStream\
    .format('kafka')\
    .option('kafka.bootstrap.servers', 'localhost:9092')\
    .option('topic', 'portfolio-analytics-output')\
    .option('checkpointLocation', '/Users/rcfor/dev/tmp/spark/checkpoint')\
    .start()
  query.awaitTermination()

  spark.stop()
