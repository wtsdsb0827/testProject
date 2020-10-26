package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.*;
import com.bgs.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.bgs.ssm.util.MD5Utils;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("login")
@EnableAutoConfiguration
public class UserController {


	@Autowired
	private UserService u;


	/*
		用户登录
	 */
	@ResponseBody
	@RequestMapping("/selectUser")
	public boolean selectUser(String userName, String password, HttpSession session) {
		User user = u.selectUser(userName, MD5Utils.md5(password));
		boolean b = false;
		if (user != null) {
			session.setAttribute("user", user);
			b = true;
		}
		return b;
	}


	/*
		菜单权限，判断父节点
	 */
	@ResponseBody
	@RequestMapping("/selectUseQuanXian")
	public List<Relation> selectUseQuanXian(Integer id) {
		List<Relation> list = u.selectUseQuanXian(id);


		//循环所有的一级菜单，并放在pList这个集合中
		/*for(Relation relation :list){
			if(relation.getpId()==0){
				pList.add(relation);
			}
		}*/

		//循环list这个集合并把子菜单的数据循环遍历到对应的父菜单下
		/*for(Relation relation :list){
			if(relation.getpId()!=0){
				for(Relation relation1:pList){
					if(relation1.getMenuId()==relation.getpId()){
						relation1.getChildList().add(relation);
					}
				}
			}
		}*/
		List<Relation> pList = new ArrayList<>();
		for (Relation relation : list) {
			if (relation.getpId() == 0) {
				List<Relation> relist = new ArrayList<>();
				for (int i = 0; i < list.size(); i++) {
					if (relation.getMenuId() == list.get(i).getpId()) {
						relist.add(list.get(i));
						List<Relation> sunlist = new ArrayList<>();
						for (int a = 0; a < list.size(); a++) {
							if (list.get(i).getMenuId() == list.get(a).getpId()) {
								sunlist.add(list.get(a));
							}
						}
						list.get(i).setChildList(sunlist);
					}
				}
				relation.setChildList(relist);
				pList.add(relation);
			}
		}
		System.out.println(pList);
		return pList;
	}

	/*
		菜单权限，判断子节点
	 */
	@ResponseBody
	@RequestMapping("/selectUseQuanXian1")
	public List<Relation> selectUseQuanXian1(Integer pId) {
		List<Relation> list = u.selectUseQuanXian1(pId);
		return list;
	}


	/*******************************************************************************************************************************************/




	/*

		角色管理查询
	*/
	@ResponseBody
	@RequestMapping("/JueSeQuanXian")
	public List<Role> JueSeQuanXian() {
		List<Role> list = u.JueSeQuanXian();
		return list;
	}

	/*

            角色管理（添加）
        */
	@ResponseBody
	@RequestMapping("/addRole")
	public boolean addRole(String roleName, String roleSort) {
		boolean b = u.addRole(roleName, roleSort);
		return b;
	}


	/*

		角色管理（删除）

	*/
	@ResponseBody
	@RequestMapping("/deleteRole")
	public boolean deleteRole(Integer id) {
		boolean b = u.deleteRole(id);
		return b;
	}

	/*

            角色管理（修改）

        */
	@ResponseBody
	@RequestMapping("/xiugaiRole")
	public boolean xiugaiRole(String roleName, String roleSort, Integer id) {
		boolean b = u.xiugaiRole(roleName, roleSort, id);
		return b;
	}


	/*******************************************************************************************************************************************/


/*
		用户管理查询
	*/
	@ResponseBody
	@RequestMapping("/YongHuQuanXian")
	public List<User> YongHuQuanXian(String userName, String allName, Integer telphone, Integer deptId) {
		List<User> list = u.YongHuQuanXian(userName, allName, telphone, deptId);
		return list;
	}


/*
	用户管理添加的部门下拉框数据查询
 */

	@ResponseBody
	@RequestMapping("/selectDept")
	public List<Dept> selectDept() {
		List<Dept> list = u.selectDept();
		return list;
	}



	/*
	用户管理添加的角色下拉框数据查询
 */

	@ResponseBody
	@RequestMapping("/selectRole")
	public List<Role> selectRole() {
		List<Role> list = u.selectRole();
		return list;
	}


/*
		用户管理的添加操作
 */

	@ResponseBody
	@RequestMapping("/addYongHu")
	public boolean addYongHu(User user) {
		boolean b = u.addYongHu(user);
		return b;
	}


	/*
            用户管理的删除操作
     */
	@ResponseBody
	@RequestMapping("/deleteYongHu")
	public boolean deleteYongHu(Integer id) {
		boolean b = u.deleteYongHu(id);
		return b;
	}




	/*
		用户管理的修改单查
	*/

	@ResponseBody
	@RequestMapping("/DanChaYongHu")
	public List<User> DanChaYongHu(Integer id) {
		List<User> list = u.DanChaYongHu(id);
		return list;
	}


	/*
            用户管理的修改操作
     */
	@ResponseBody
	@RequestMapping("/updateYongHu")
	public boolean updateYongHu(User user) {
		boolean b = u.updateYongHu(user);
		return b;
	}


	/*******************************************************************************************************************************************/

	/*
		部门管理查询
	*/
	@ResponseBody
	@RequestMapping("/BuMenQuanXian")
	public List<Dept> BuMenQuanXian(String deptName, String contact, String contactphone) {
		List<Dept> list = u.BuMenQuanXian(deptName, contact, contactphone);
		return list;
	}


	/*
            用户管理的删除操作
     */
	@ResponseBody
	@RequestMapping("/deleteBuMen")
	public boolean deleteBuMen(Integer id) {
		boolean b = u.deleteBuMen(id);
		return b;
	}


	/*
            查询部门名称回显
     */
	@ResponseBody
	@RequestMapping("/selectDeptHuiXian")
	public List<Dept> selectDeptHuiXian() {
		List<Dept> list = u.selectDeptHuiXian();
		List<Dept> pList = new ArrayList<>();
		for (Dept dept : list) {
			if (dept.getPid() == 0) {
				pList.add(dept);
				buildTree(dept, list);
			}
		}
		print("", pList);
		System.out.println(list);
		return list;
	}

	public void buildTree(Dept dept1, List<Dept> list) {
		for (Dept dept : list) {
			if (dept1.getId() == dept.getPid()) {
				dept1.getChildList().add(dept);
				buildTree(dept, list);
			}
		}
	}


	public void print(String prefix, List<Dept> list) {
		prefix += "|-";
		for (Dept dept : list) {
			System.out.println(prefix + "" + dept.getDeptName());
			dept.setDeptName(prefix + "" + dept.getDeptName());    //将输出内容设置进去
			if (!dept.getChildList().isEmpty()) {
				print(prefix, dept.getChildList());
			}
		}
	}


	/*
            添加部门管理
     */
	@ResponseBody
	@RequestMapping("/addDept")
	public boolean addDept(Dept dept) {
		boolean b = u.addDept(dept);
		return b;
	}


    /*
        修改的单查操作
     */

	@ResponseBody
	@RequestMapping("/DanChaBuMen")
	public List<Dept> DanChaBuMen(Integer id) {
		List<Dept> list = u.DanChaBuMen(id);
		return list;
	}


	/*
    部门管理的修改操作
 */
	@ResponseBody
	@RequestMapping("/updateBuMen")
	public boolean updateBuMen(Dept dept) {
		boolean b = u.updateBuMen(dept);
		return b;
	}


	/*******************************************************************************************************************************************/

	/*
		规格管理查询
	*/
	@ResponseBody
	@RequestMapping("/GuiGeQuanXian")
	public List<Product> GuiGeQuanXian(Integer bianma, String productName, String productSize, String productStatus) {
		List<Product> list = u.GuiGeQuanXian(bianma, productName, productSize, productStatus);
		return list;
	}

	/*
		规格管理的添加
	 */
	@ResponseBody
	@RequestMapping("/addGuiGe")
	public boolean addGuiGe(Product product) {
		boolean b = u.addGuiGe(product);
		return b;
	}

	/*
		删除
	 */
	@ResponseBody
	@RequestMapping("/deleteGuiGe")
	public boolean deleteGuiGe(Integer id) {
		boolean b = u.deleteGuiGe(id);
		return b;
	}


	/*
			修改单查
	 */

	@ResponseBody
	@RequestMapping("/DanChaGuiGe")
	public List<Product> DanChaGuiGe(Integer id) {
		List<Product> list = u.DanChaGuiGe(id);
		return list;
	}


	/*
		修改
	 */
	@ResponseBody
	@RequestMapping("/updateGuiGe")
	public boolean updateGuiGe(Product product) {
		boolean b = u.updateGuiGe(product);
		return b;
	}


	/*
		审核
	 */
	@ResponseBody
	@RequestMapping("/selectStatus")
	public List<Product> selectStatus() {
		List<Product> list = u.selectStatus();
		return list;
	}


	/*
		修改审核状态
	 */

	@ResponseBody
	@RequestMapping("/XiuGaiStatus")
	public boolean XiuGaiStatus(Integer id, String productStatus) {
		boolean b = u.XiuGaiStatus(id, productStatus);
		return b;
	}


	/*
		订单管理的下拉框状态回显
	 */
	@ResponseBody
	@RequestMapping("/HuiXianDingDanManager2")
	public List<Customer> HuiXianDingDanManager2() {
		List<Customer> list = u.HuiXianDingDanManager2();
		return list;
	}

	@ResponseBody
	@RequestMapping("/HuiXianDingDanManager3")
	public List<Dept> HuiXianDingDanManager3() {
		List<Dept> list = u.HuiXianDingDanManager3();
		return list;
	}

	@ResponseBody
	@RequestMapping("/HuiXianDingDanManager4")
	public List<User> HuiXianDingDanManager4() {
		List<User> list = u.HuiXianDingDanManager4();
		return list;
	}


	/*
	    订单管理的全查
	 */
	@ResponseBody
	@RequestMapping(value = "/DingDanQuanXian", method = RequestMethod.POST)
	public List<DingDan> DingDanQuanXian(@RequestBody DingDan dingDan) {
		List<DingDan> list = u.DingDanQuanXian(dingDan);
		return list;
	}


	/*
            订单管理的单查
         */
	@ResponseBody
	@RequestMapping(value = "/selectDingDanCha", method = RequestMethod.POST)
	public List<DingDanInfo> selectDingDanCha(@RequestBody DingDanInfo dingDanInfo) {
		List<DingDanInfo> list = u.selectDingDanCha(dingDanInfo);
		System.out.println("--------------" + list + "--------------");
		return list;
	}


	/*
            订单管理的单查
         */
	@ResponseBody
	@RequestMapping(value = "/DingDanXiangQing", method = RequestMethod.POST)
	public DingDan DingDanXiangQing(@RequestBody DingDan dingdan) {
		DingDan list = u.DingDanXiangQing(dingdan);
		return list;
	}


	/*******************************************************************************************************************************************/



	/*
			订单确认的删除
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteDingDan", method = RequestMethod.POST)
	public boolean deleteDingDan(@RequestBody DingDan dingdan) {
		boolean b = u.deleteDingDan(dingdan);
		return b;
	}


	/*
			订单确认的添加
	 */
	@ResponseBody
	@RequestMapping(value = "/TianJiaDingDan", method = RequestMethod.POST)
	public boolean TianJiaDingDan(@RequestBody Map<String, Object> map) throws ParseException {
		boolean b = u.TianJiaDingDan(map);
		return b;
	}




    	/*
			订单确认的编码查询
	 */

	@ResponseBody
	@RequestMapping(value = "/selectBianMa", method = RequestMethod.POST)
	public List<Product> selectBianMa() {
		List<Product> list = u.selectBianMa();
		return list;
	}


	/*
			订单确认的修改功能
	 */
	@ResponseBody
	@RequestMapping(value = "/XiuGaiDingDan", method = RequestMethod.POST)
	public boolean XiuGaiDingDan(@RequestBody DingDan dingdan) {
		boolean b = u.XiuGaiDingDan(dingdan);
		return b;
	}


	/*
			订单完成功能
	 */
	@ResponseBody
	@RequestMapping(value = "/dingdanWanCheng", method = RequestMethod.POST)
	public boolean dingdanWanCheng(@RequestBody DingDan dingdan, String orderStatus, Integer id) {
		boolean b = u.dingdanWanCheng(dingdan, id, orderStatus);
		return b;
	}


	/*
            产品表的单查
     */
	@ResponseBody
	@RequestMapping(value = "/loadProperty", method = RequestMethod.POST)
	public Product loadProperty(@RequestBody Product product) {
		Product p = u.loadProperty(product);
		return p;
	}

	/*
           产品表的单查
    */
	@ResponseBody
	@RequestMapping(value = "/loadProperty2", method = RequestMethod.POST)
	public Product loadProperty2(@RequestBody Product product) {
		Product p = u.loadProperty2(product);
		return p;
	}





	/*
			订单信息的修改回显
	 */

	@ResponseBody
	@RequestMapping(value = "/xiugaiDingDanDanCha", method = RequestMethod.POST)
	public List<DingDanInfo> xiugaiDingDanDanCha(@RequestBody DingDanInfo dingDanInfo) {
		List<DingDanInfo> list = u.xiugaiDingDanDanCha(dingDanInfo);
		System.out.println("===++===" + list + "=====++====");
		return list;
	}


	/*
		修改的确认
	 */
	@ResponseBody
	@RequestMapping(value = "/XiuGaiQueRen", method = RequestMethod.POST)
	public boolean XiuGaiQueRen(@RequestBody DingDanInfo dingDanInfo) throws ParseException {
		boolean b = u.XiuGaiQueRen(dingDanInfo);
		return b;
	}


	/*
			//修改的删除
	 */
	@ResponseBody
	@RequestMapping(value = "/XiuGaiShanChu", method = RequestMethod.POST)
	public boolean XiuGaiShanChu(@RequestBody DingDanInfo dingDanInfo) {
		boolean b = u.XiuGaiShanChu(dingDanInfo);
		return b;
	}


	/*
		修改订单和订单信息
	 */
	@ResponseBody
	@RequestMapping(value = "/updateDingDanXinXi", method = RequestMethod.POST)
	public boolean updateDingDanXinXi(@RequestBody Map<String, Object> map) throws ParseException {
		System.out.println("**************" + map + "*******************");
		boolean b = u.updateDingDanXinXi(map);
		return b;
	}



	/*
			排产计划的全查
	*/


	@ResponseBody
	@RequestMapping(value = "/quanchaPlan", method = RequestMethod.POST)
	public List<Schedulingplan> quanchaPlan(@RequestBody(required =false ) Schedulingplan schedulingplan) {
		List<Schedulingplan> list = u.quanchaPlan(schedulingplan);
		return list;
	}


/*
			排产计划查询订单编码
	*/


	@ResponseBody
	@RequestMapping(value = "/selectDingdanEmpno", method = RequestMethod.POST)
	public List<DingDan> selectDingdanEmpno(@RequestBody(required =false ) DingDan dingDan) {
		List<DingDan> list = u.selectDingdanEmpno(dingDan);
		return list;
	}



/*
			排产计划查询订单编码
	*/
    @ResponseBody
    @RequestMapping(value = "/XinZengPaiChan", method = RequestMethod.POST)
    public boolean XinZengPaiChan(@RequestBody(required=false) Map<String,Object> map) {
        boolean b = u.XinZengPaiChan(map);
        return b;
    }


    /*
        排产计划查询批次
     */
    @ResponseBody
    @RequestMapping(value = "/PiCiHuiXian", method = RequestMethod.POST)
    public List<Batch> PiCiHuiXian(@RequestBody(required =false) Batch batch) {
        List<Batch> list = u.PiCiHuiXian(batch);
        return list;
    }


    /*
        订单号的回显
     */

    @ResponseBody
    @RequestMapping(value = "/GenZongHaoHuiXian", method = RequestMethod.POST)
    public Schedulingplan GenZongHaoHuiXian(@RequestBody(required =false) Schedulingplan schedulingplan) {
        Schedulingplan list = u.GenZongHaoHuiXian(schedulingplan);
        System.out.println("==="+list+"====");
        return list;
    }

    /*
        删除订单批次
     */
    @ResponseBody
    @RequestMapping(value = "/shanChuPiCi", method = RequestMethod.POST)
    public int shanChuPiCi(@RequestBody(required =false) Batch batch) {
        int i = u.shanChuPiCi(batch);
        return i;
    }



/*
		回显生产信息
 */
	@ResponseBody
	@RequestMapping(value = "/selectProductionInfo",method = RequestMethod.POST)
	public List<Productioninformation> selectProductionInfo(@RequestBody(required = false) Productioninformation productioninformation){
		List<Productioninformation> list = u.selectProductionInfo(productioninformation);
		return list;
	}



	/*
		删除生产信息
	 */

	@ResponseBody
	@RequestMapping(value = "/removeProductionInfo",method = RequestMethod.POST)
	public boolean removeProductionInfo(@RequestBody(required = false) Productioninformation productioninformation){
		boolean b = u.removeProductionInfo(productioninformation);
		return b;
	}



	/*
			查询跟进信息表
	 */

	@ResponseBody
	@RequestMapping(value = "/selectgenjinInfo",method = RequestMethod.POST)
	public List<Followup> selectgenjinInfo(@RequestBody(required = false) Followup followup){
		List<Followup> list = u.selectgenjinInfo(followup);
		return list;
	}



	/*
			删除跟进信息
	 */
	@ResponseBody
	@RequestMapping(value = "/removeGenJinInfo",method = RequestMethod.POST)
	public boolean removeGenJinInfo(@RequestBody(required = false) Followup followup){
		boolean b = u.removeGenJinInfo(followup);
		return b;
	}


	/*
		修改生产信息
	 */
	@ResponseBody
	@RequestMapping(value = "/QueDingXiuGaiPiCi",method = RequestMethod.POST)
	public boolean QueDingXiuGaiPiCi(@RequestBody(required = false) Map<String,Object> map){
		boolean b = u.QueDingXiuGaiPiCi(map);
		return b;
	}

	/*
		添加生产信息
	 */
	@ResponseBody
	@RequestMapping(value = "/QueDingTianjiaPiCi",method = RequestMethod.POST)
	public boolean QueDingTianjiaPiCi(@RequestBody(required = false) Map<String,Object> map){
		boolean b = u.QueDingTianjiaPiCi(map);
		return b;
	}


	/*
		点击新增时的查询判断
	 */

	@ResponseBody
	@RequestMapping(value = "/LianChaXinZengPanDuan", method = RequestMethod.POST)
	public List<Schedulingplan> LianChaXinZengPanDuan(@RequestBody(required =false) Schedulingplan schedulingplan) {
		List<Schedulingplan> list = u.LianChaXinZengPanDuan(schedulingplan);
		return list;
	}





	//全部数据的回显
	@ResponseBody
	@RequestMapping(value = "/QuanHuiXian", method = RequestMethod.POST)
	public List<Batch> QuanHuiXian(@RequestBody(required =false) Batch batch) {
		List<Batch> list = u.QuanHuiXian(batch);
		return list;
	}


	/*
		订单确认模块与排产相关联的信息
	 */

	@ResponseBody
	@RequestMapping(value = "/selectPaiChanHao", method = RequestMethod.POST)
	public Schedulingplan selectPaiChanHao(@RequestBody(required =false) Schedulingplan schedulingplan) {
		Schedulingplan list = u.selectPaiChanHao(schedulingplan);
		return list;
	}

	/*
		查询批次信息
	 */
	@ResponseBody
	@RequestMapping(value = "/selectPiCiHao", method = RequestMethod.POST)
	public List<Batch> selectPiCiHao(@RequestBody(required =false) Batch batch) {
		List<Batch> list = u.selectPiCiHao(batch);
		return list;
	}

	/*
		查询产品信息
	 */

	@ResponseBody
	@RequestMapping(value = "/selectProduct", method = RequestMethod.POST)
	public List<Product> selectProduct(@RequestBody(required =false) Product product) {
		List<Product> list = u.selectProduct(product);
		return list;
	}

	/*
		查询跟进信息
	 */

	@ResponseBody
	@RequestMapping(value = "/selectFollowUp", method = RequestMethod.POST)
	public List<Followup> selectFollowUp(@RequestBody(required =false) Followup followup) {
		List<Followup> list = u.selectFollowUp(followup);
		return list;
	}




/*
	重定向练习
 */
	@RequestMapping(value = "/uuu",method = RequestMethod.GET)
	public String uuu(){
		return "redirect:/success.jsp";
	}


}