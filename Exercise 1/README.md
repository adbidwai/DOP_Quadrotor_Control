## Analysis of variation of elements and determination of the rotation matrix when the rotational dynamics equation is integrated through the *ode 45* solver 

### Results: 
![image](https://user-images.githubusercontent.com/46625413/135575096-c2cc2ab1-7f63-408b-a403-23c44f4e6177.png)
* Above graph on the right shows the time variation of the component element of the rotation matrices. Their values get damped due to the linear nature of integration of the ode45 solver. 
* This fails to keep the determinant magnitude of the rotation matrix to be 1 at all times as evident in the graph on the right.

