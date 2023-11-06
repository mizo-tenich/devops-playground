# DevOps Challenge Responses

---

### Curl Command Response
```shell
MacBook-Pro-de-Mizo:~ mizo$ curl  \
  -H "Accept: application/json;charset=UTF-8" \
  -H "Content-Type: application/json" \
  -H "Authorization: Basic bmVvNGo6bXlTZWNyZXRQYXNzd29yZA==" \
  -d  "{\"statements\":[{\"statement\":\"MATCH (p:Person) RETURN count(p)\"}]}" \
  http://localhost:7474/db/neo4j/tx/commit
{"results":[{"columns":["count(p)"],"data":[{"row":[0],"meta":[null]}]}],"errors":[]}MacBook-Pro-de-Mizo:~ mizo$
```

**Technical Stories**

1. As a developer, I want to test my branches before merging to main, so I don't make untested changes in live infrastructure.  
   **Response**: We should clearly define our branching strategy and separate by environments or features. Integration of code coverage into our Continuous Integration (CI) process for review and analysis is crucial. This helps ensure that untested changes do not make it to production.

2. As an infrastructure engineer, I want Neo4j to hold state in a persistent volume, so when pod restarts I keep the data.  
   **Response**: The pods use a persistent volume, ensuring that values remain available even if the pod restarts.

3. As a devops engineer, I want a workflow for merging into main that applies infra changes, so we avoid manual changes.  
   **Response**: I would utilize Infrastructure as Code (IaC) tools like Terraform, which allow you to check the infrastructure's state through the terraform state file. It's also beneficial to maintain a repository dedicated to infrastructure code.

4. As a devops engineer, I want to test that the data was loaded, so my confidence increases.  
   **Response**: We could implement the use of hashes such as SHA-256 or SHA-3, or even checksums to ensure data integrity.

5. As a service manager, I want to provision new Neo4j instances by using blue-green deployment, so that, there is no downtime. Use the two data releases provided.  
   **Response**: I could set up data persistence in Kubernetes and implement the workflow using IaC.

---

**Discussion**
1. What would we need to change to deal with very large data files?  
   **Response**: I would use AWS S3's rsync for file manipulation.

2. What would be a good choice for our volumes?  
   **Response**: I would use AWS EFS for handling large volumes of data.

3. If we use this import process in a real environment, is there any risk that our data could get stolen?  
   **Response**: Yes, I would start using AWS Secrets or SSM parameters for managing sensitive data.

4. What networking assets would you put in place to minimize the risk of unauthorized connections?  
   **Response**: I would review the current state of the VPCs and use private subnets that are not exposed to the internet.
