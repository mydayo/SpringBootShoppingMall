package com.app;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;


//테이블은 단 1개만 사용합니다.
//User 정보는 userId, password에, User가 구매한 제품 정보는 item에 저장됩니다.

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@NotNull
	private String userId;
	private String password;
	private String item;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	@NotNull
	public String getUserId() {
		return userId;
	}

	public void setUserId(@NotNull String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	// 유저의 구매 리스트
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", userId='" + userId + '\'' +
				", password='" + password + '\'' +
				", item='" + item + '\'' +
				'}';
	}
}
