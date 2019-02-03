private IntWritable one = new IntWritable(1);
private IntWritable output = new IntWritable()
proctected void map(
LongWritable key,Text value, Context context) {
String[] fields = value.split("\t");
output.set(Integer.parseInt(fields[1]));
context.write(one, output);
}
IntWritable one = new IntWritable(1);
DoubleWritable average = new DoubleWritable();
protected void reduce(IntWritable key,Iterable<IntWritable> values,Context context) {
int sum = 0 ; int count = 0;
for(IntWritable value : values) {
sum += value.get(); count++;
}
average.set(sum / (double) count);
context.Write(key, average);
}