# JSON to Tree - Server
## Example
### Request example
```
{ "users" : [ { "name" : "Alice" , "age" : 20 } ] }
```
### Response example
```
dict * 
	\users
	: list dict 
		* 
			\name
			: string \Alice
		* 
			\age
			: int \20
```
## How to start the server
1. Download sources
```
git clone https://github.com/Pox3R/jsontree
```
2. Now change current directory to project directory from terminal:
```
cd jsontree
```
3. Generate Dockerfile and create Docker image (it can take few minuts):
```
./gradlew createImage
```
4. Start the server with command:
```
docker run -p 80:80 myserver
```
5. Now wait few minutes until server run
6. To stop the server get container id with ```docker container ls``` and kill container with ```docker container stop id```
## How to use
1. Download Postman from ```https://www.getpostman.com/```
2. Configure POST request
   1. Choose the POST method
   2. Enter ```localhost:80/```
   3. Choose **Body**
   4. Choose **raw**
   5. Set content type to ```JSON(application/json)```
   6. Paste your JSON data
   7. Push the **Send** button
