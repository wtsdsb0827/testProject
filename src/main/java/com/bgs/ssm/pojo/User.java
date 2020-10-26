package com.bgs.ssm.pojo;
/*
	用户表
 */
public class User {

	private Integer  id;
	private String  userName;	//用户名
	private String  password;	//密码
	private String  allName;	//中文名
	private Integer  roleId;	//角色表关联
	private Integer  telphone;		//电话
	private Integer  deptId;	//部门表关联
	private String email;	//邮箱
	private String introduce;	//简介



	private String deptName;	//部门名称
	private String roleName;	//角色名称


	String name;
	String c1;


	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAllName() {
		return allName;
	}
	public void setAllName(String allName) {
		this.allName = allName;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}


	public Integer getTelphone() {
		return telphone;
	}

	public void setTelphone(Integer telphone) {
		this.telphone = telphone;
	}

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getC1() {
		return c1;
	}

	public void setC1(String c1) {
		this.c1 = c1;
	}


	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", userName='" + userName + '\'' +
				", password='" + password + '\'' +
				", allName='" + allName + '\'' +
				", roleId=" + roleId +
				", telphone=" + telphone +
				", deptId=" + deptId +
				", email='" + email + '\'' +
				", introduce='" + introduce + '\'' +
				", deptName='" + deptName + '\'' +
				", roleName='" + roleName + '\'' +
				", name='" + name + '\'' +
				", c1='" + c1 + '\'' +
				'}';
	}
}
