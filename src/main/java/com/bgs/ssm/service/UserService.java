package com.bgs.ssm.service;

import com.bgs.ssm.pojo.*;
import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Repository
public interface UserService {

    //用户登录操作
   User selectUser(String userName, String password);

    //菜单权限设置判断父节点
    List<Relation> selectUseQuanXian(Integer id);

    //菜单权限设置判断子节点
    List<Relation> selectUseQuanXian1(Integer pId);

    //角色管理查询
    List<Role> JueSeQuanXian();

    //角色管理（添加）
    boolean addRole(String roleName, String roleSort);

    //角色管理（删除）
    boolean deleteRole(Integer id);

    //角色管理（修改）
    boolean xiugaiRole(String roleName, String roleSort, Integer id);

    //用户管理（查询）
    List<User> YongHuQuanXian(String userName, String allName, Integer telphone, Integer deptId);

    //用户管理(添加下拉框的部门的数据回显)
    List<Dept> selectDept();

    //用户管理(添加下拉框的角色的数据回显)
    List<Role> selectRole();

    //用户管理(添加)
    boolean addYongHu(User user);

    //用户管理的删除操作
    boolean deleteYongHu(Integer id);

    //用户管理的修改操作
    boolean updateYongHu(User user);

    //用户管理的修改单查
    List<User> DanChaYongHu(Integer id);
    User DanChaYongHu1(Integer id);


    //部门管理全查
    List<Dept> BuMenQuanXian(String deptName, String contact, String contactphone);

    //删除
    boolean deleteBuMen(Integer id);

    //查询部门并回显
    List<Dept> selectDeptHuiXian();

    //添加部门管理
    boolean addDept(Dept dept);

    //部门管理修改的单查
    List<Dept> DanChaBuMen(Integer id);

    //部门管理的修改操作
    boolean updateBuMen(Dept dept);


    //规格管理的全查
    List<Product> GuiGeQuanXian(Integer bianma, String productName, String productSize, String productStatus);


    //规格管理的添加
    boolean addGuiGe(Product product);


    //规格管理的删除
    boolean deleteGuiGe(Integer id);


    //规格管理的修改
    boolean updateGuiGe(Product product);


    //修改单查
    List<Product> DanChaGuiGe(Integer id);


    //审核
    List<Product> selectStatus();


    //修改审核状态
    boolean XiuGaiStatus(Integer id, String productStatus);


    //订单管理的下拉框回显
    List<Customer> HuiXianDingDanManager2();
    List<Dept> HuiXianDingDanManager3();
    List<User> HuiXianDingDanManager4();


    //订单管理的全查
   /* List<DingDan> DingDanQuanXian(String orderStatus, Integer customerId, Integer deptId, Integer userId, String orderName, Integer orderEmpno, String orderDate);*/

    //订单管理的单查
    List<DingDanInfo> selectDingDanCha(DingDanInfo dingDanInfo);


    List<DingDan> DingDanQuanXian(DingDan dingDan);

    //订单管理的单查
    DingDan DingDanXiangQing(DingDan dingdan);


    //订单确认的删除
    boolean deleteDingDan(DingDan dingdan);

    //订单确认的添加
    boolean TianJiaDingDan(Map<String, Object> dingdan) throws ParseException;



    //订单确认的修改
    boolean XiuGaiDingDan(DingDan dingdan);

    //订单确认的完成
    boolean dingdanWanCheng(DingDan dingdan,Integer id,String orderStatus);

    //编码的查询
    List<Product> selectBianMa();

    //产品表的单查
    Product loadProperty(Product product);
    Product loadProperty2(Product product);


    //订单信息的修改回显
    List<DingDanInfo> xiugaiDingDanDanCha(DingDanInfo dingDanInfo);

    //修改的确认
    boolean XiuGaiQueRen(DingDanInfo dingDanInfo) throws ParseException;

    //修改的删除
    boolean XiuGaiShanChu(DingDanInfo dingDanInfo);

    //修改订单和订单信息
    boolean updateDingDanXinXi(Map<String,Object> map) throws ParseException;




    //排产计划的全查
    List<Schedulingplan> quanchaPlan(Schedulingplan schedulingplan);

    //排产计划查询订单编码
    List<DingDan> selectDingdanEmpno(DingDan dingDan);


    //排产计划查询订单编码
    boolean XinZengPaiChan(Map<String,Object> map);

    //排产计划查询批次
    List<Batch> PiCiHuiXian(Batch batch);

    //订单号的回显
    Schedulingplan GenZongHaoHuiXian(Schedulingplan schedulingplan);

    //删除订单批次
    int shanChuPiCi(Batch batch);


    //回显生产信息
    List<Productioninformation> selectProductionInfo(Productioninformation productioninformation);

    //删除生产信息
    boolean removeProductionInfo(Productioninformation productioninformation);

    //查询跟进信息表
    List<Followup> selectgenjinInfo(Followup followup);

    //删除跟进信息
    boolean removeGenJinInfo(Followup followup);

    //修改添加生产信息
    boolean QueDingXiuGaiPiCi(Map<String,Object> map);

    //添加生产信息
    boolean QueDingTianjiaPiCi(Map<String,Object> map);

    //全部数据的回显
    List<Batch> QuanHuiXian(Batch batch);

    //点击新增时的查询判断
    List<Schedulingplan> LianChaXinZengPanDuan(Schedulingplan schedulingplan);

    Schedulingplan selectPaiChanHao(Schedulingplan schedulingplan);

    List<Batch> selectPiCiHao(Batch batch);

    List<Product> selectProduct(Product product);

    //查询跟进信息
    List<Followup> selectFollowUp(Followup followup);





    List<XiaoShuo> selectZongTuiJian(XiaoShuo xiaoShuo);
    List<XiaoShuo> FirstClassify(XiaoShuo xiaoShuo);
    List<XiaoShuo> SecondClassify(XiaoShuo xiaoShuo);
    List<XiaoShuo> ThirdClassify(XiaoShuo xiaoShuo);
}

