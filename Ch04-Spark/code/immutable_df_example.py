from pyspark.sql import SparkSession

# Initialize a Spark session
spark = SparkSession.builder.appName("SimpleDataFrame").getOrCreate()

# Create a DataFrame
data = [("John", 28), ("Smith", 44), ("Adam", 65), ("Henry", 23)]
columns = ["Name", "Age"]
df = spark.createDataFrame(data, columns)

# Show the original DataFrame
df.show()

# filter rows where the age is greater than 30
filtered_df = df.filter(df.Age > 30)

# Show the transformed DataFrame
filtered_df.show()