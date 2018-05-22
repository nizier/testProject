package com.icss.vo;

public class DeptVO {
	
		private int dept_id;
		/**
		 * @Fields man : ��
		 */
		private String name;
		/**
		 * @Fields woman : Ů
		 */
//		private String parent_id;
		
		private int dept_level;
		private String parent_name;
		private String parent_id;

		private String name4;
		private String name3;
		private String name2;
		public String getParent_id() {
			return parent_id;
		}
		public void setParent_id(String parent_id) {
			this.parent_id = parent_id;
		}
		private String name1;

		
		public int getDept_id() {
			return dept_id;
		}
		public void setDept_id(int dept_id) {
			this.dept_id = dept_id;
		}
		
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getDept_level() {
			return dept_level;
		}
		public void setDept_level(int dept_level) {
			this.dept_level = dept_level;
		}
		public String getParent_name() {
			return parent_name;
		}
		public void setParent_name(String parent_name) {
			this.parent_name = parent_name;
		}
		public String getName4() {
			return name4;
		}
		public void setName4(String name4) {
			this.name4 = name4;
		}
		public String getName3() {
			return name3;
		}
		public void setName3(String name3) {
			this.name3 = name3;
		}
		public String getName2() {
			return name2;
		}
		public void setName2(String name2) {
			this.name2 = name2;
		}
		public String getName1() {
			return name1;
		}
		public void setName1(String name1) {
			this.name1 = name1;
		}
		
	}


