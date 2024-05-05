from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# Initialize a Spark session
spark = SparkSession.builder.appName("SimpleTransformationExample").getOrCreate()

# Create an RDD
rdd = spark.sparkContext.parallelize([
    ("John", 28),
    ("Smith", 44),
    ("Adam", 65),
    ("Henry", 23)
])

# Apply a map transformation to create a new RDD with a tuple including the name and a boolean flag
# if the person is older than 30
mapped_rdd = rdd.map(lambda x: (x[0], x[1], x[1] > 30))

# Filter the RDD to include only people older than 30
filtered_rdd = mapped_rdd.filter(lambda x: x[2])

# Convert the filtered RDD back to a DataFrame
df = spark.createDataFrame(filtered_rdd, ["Name", "Age", "OlderThan30"])

# Select only the name and age columns
final_df = df.select("Name", "Age")

# Collect the results which triggers the execution of all transformations
results = final_df.collect()

# Stop the Spark session
spark.stop()
