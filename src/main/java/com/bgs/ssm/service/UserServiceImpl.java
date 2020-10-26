package com.bgs.ssm.service;

import com.bgs.ssm.mapper.UserMapper;
import com.bgs.ssm.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper s;


    //用户登录操作
    @Override
    public User selectUser(String userName, String password) {
        return s.selectUser(userName, password);
    }

    //菜单权限设置判断父节点
    @Override
    public List<Relation> selectUseQuanXian(Integer id) {
        return s.selectUseQuanXian(id);
    }

    //菜单权限设置判断子节点
    @Override
    public List<Relation> selectUseQuanXian1(Integer pId) {
        return s.selectUseQuanXian1(pId);
    }

    //角色管理全查
    @Override
    public List<Role> JueSeQuanXian() {
        return s.JueSeQuanXian();
    }

    //角色管理（添加）
    @Override
    public boolean addRole(String roleName, String roleSort) {
        return s.addRole(roleName, roleSort);
    }

    //角色管理（删除）
    @Override
    public boolean deleteRole(Integer id) {
        return s.deleteRole(id);
    }

    //角色管理（修改）
    @Override
    public boolean xiugaiRole(String roleName, String roleSort, Integer id) {
        return s.xiugaiRole(roleName, roleSort, id);
    }

    //用户管理全查
    @Override
    public List<User> YongHuQuanXian(String userName, String allName, Integer telphone, Integer deptId) {
        return s.YongHuQuanXian(userName, allName, telphone, deptId);
    }

    //用户管理(添加下拉框的部门的数据回显)
    @Override
    public List<Dept> selectDept() {
        return s.selectDept();
    }

    //用户管理(添加下拉框的角色的数据回显)
    @Override
    public List<Role> selectRole() {
        return s.selectRole();
    }

    //用户管理(添加)
    @Override
    public boolean addYongHu(User user) {
        return s.addYongHu(user);
    }

    //用户管理的删除操作
    @Override
    public boolean deleteYongHu(Integer id) {
        return s.deleteYongHu(id);
    }

    //用户管理的修改操作
    @Override
    public boolean updateYongHu(User user) {
        return s.updateYongHu(user);
    }

    //用户管理的修改单查
    @Override
    public List<User> DanChaYongHu(Integer id) {
        return s.DanChaYongHu(id);
    }

    @Override
    public User DanChaYongHu1(Integer id) {
        return s.DanChaYongHu1(id);
    }


    //部门管理全查
    @Override
    public List<Dept> BuMenQuanXian(String deptName, String contact, String contactphone) {
        return s.BuMenQuanXian(deptName, contact, contactphone);
    }

    //删除
    @Override
    public boolean deleteBuMen(Integer id) {
        return s.deleteBuMen(id);
    }

    //查询部门并回显
    @Override
    public List<Dept> selectDeptHuiXian() {
        return s.selectDeptHuiXian();
    }

    //添加部门管理
    @Override
    public boolean addDept(Dept dept) {
        return s.addDept(dept);
    }

    //部门管理修改的单查
    @Override
    public List<Dept> DanChaBuMen(Integer id) {
        return s.DanChaBuMen(id);
    }

    //部门管理的修改操作
    @Override
    public boolean updateBuMen(Dept dept) {
        return s.updateBuMen(dept);
    }

    //规格管理的全查
    @Override
    public List<Product> GuiGeQuanXian(Integer bianma, String productName, String productSize, String productStatus) {
        return s.GuiGeQuanXian(bianma, productName, productSize, productStatus);
    }

    //规格管理的添加
    @Override
    public boolean addGuiGe(Product product) {
        return s.addGuiGe(product);
    }

    //规格管理的删除
    @Override
    public boolean deleteGuiGe(Integer id) {
        return s.deleteGuiGe(id);
    }

    //规格管理的修改
    @Override
    public boolean updateGuiGe(Product product) {
        return s.updateGuiGe(product);
    }

    //修改单查
    @Override
    public List<Product> DanChaGuiGe(Integer id) {
        return s.DanChaGuiGe(id);
    }

    //审核
    @Override
    public List<Product> selectStatus() {
        return s.selectStatus();
    }

    //修改审核状态
    @Override
    public boolean XiuGaiStatus(Integer id, String productStatus) {
        return s.XiuGaiStatus(id, productStatus);
    }

    //订单管理的下拉框回显
    @Override
    public List<Customer> HuiXianDingDanManager2() {
        return s.HuiXianDingDanManager2();
    }
    @Override
    public List<Dept> HuiXianDingDanManager3() {
        return s.HuiXianDingDanManager3();
    }
    @Override
    public List<User> HuiXianDingDanManager4() {
        return s.HuiXianDingDanManager4();
    }


    //订单全查
    @Override
    public List<DingDan> DingDanQuanXian(DingDan dingDan) {
        return s.DingDanQuanXian(dingDan);
    }


    //订单管理的单查
    @Override
    public List<DingDanInfo> selectDingDanCha(DingDanInfo dingDanInfo) {
        return s.selectDingDanCha(dingDanInfo);
    }


    //订单详情的查询
    @Override
    public DingDan DingDanXiangQing(DingDan dingdan) {
        return s.DingDanXiangQing(dingdan);
    }


    //订单确认的删除
    @Override
    public boolean deleteDingDan(DingDan dingdan) {
        return s.deleteDingDan(dingdan);
    }



    //订单确认的添加
    @Override
    public boolean TianJiaDingDan(Map<String, Object> list) throws ParseException {
        List<Map<String,Object>> l = (List<Map<String, Object>>) list.get("id");
        boolean b = false;
        b=s.TianJiaDingDan(list);
        Integer dingdid = (Integer) list.get("id");
        System.out.println("+=+=+=+="+dingdid);
        for (Map<String,Object> ii:l){
            //前端传过来的名字叫id
            Object id = ii.get("id");
            String infoTime1 = (String) ii.get("infoTime");
            System.out.println(infoTime1);
            String ss = infoTime1.replace("Z"," UTC");
            SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS Z");
            Date infoTime= sim.parse(ss);
            Object infoNumber =ii.get("infoNumber");
            Object productId =ii.get("productId");
            if(b) {
                try {
                    b = TianJiaDingDanInfo(id,dingdid,infoTime,infoNumber,productId);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }
        }

       return b;
    }

    //订单信息表的添加
    @Transactional
    public boolean TianJiaDingDanInfo(Object id,Integer dingdid,Date infoTime, Object infoNumber,Object productId) throws ParseException {
           return  s.TianJiaDingDanInfo(id,dingdid,infoTime,infoNumber,productId);
    }



    //订单确认的修改
    @Override
    public boolean XiuGaiDingDan(DingDan dingdan) {
        return s.XiuGaiDingDan(dingdan);
    }

    //订单确认的完成
    @Override
    public boolean dingdanWanCheng(DingDan dingdan,Integer id,String orderStatus) {
        boolean b=false;
        if(dingdan.getOrderStatus()!="已结束"){
          return s.dingdanWanCheng(dingdan,id,orderStatus);
        }else{
            return b;
        }
    }



    //编码的查询
    @Override
    public List<Product> selectBianMa() {
        return s.selectBianMa();
    }


    //产品表的单查
    @Override
    public Product loadProperty(Product product) {
        return s.loadProperty(product);
    }

    @Override
    public Product loadProperty2(Product product) {
        return s.loadProperty2(product);
    }





    //订单信息的修改回显
    @Override
    public List<DingDanInfo> xiugaiDingDanDanCha(DingDanInfo dingDanInfo) {
        Integer id = dingDanInfo.getId();
        return s.xiugaiDingDanDanCha(id);
    }


    //修改的确认
    @Override
    public boolean XiuGaiQueRen(DingDanInfo dingDanInfo) throws ParseException {
        boolean b=false;
        if(dingDanInfo!=null){
            Integer id = dingDanInfo.getId();
            Integer infoNumber = dingDanInfo.getInfoNumber();               //总数量
            Integer infoWillrenumber = dingDanInfo.getInfoWillrenumber();  //待确认数量
            Integer infoAllrenumber=infoNumber-infoWillrenumber;

            String infoTime1 = dingDanInfo.getInfoTime();
            String ss = infoTime1.replace("Z"," UTC");
            SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS Z");
            Date infoTime= sim.parse(ss);
            b=s.XiuGaiQueRen(id,infoWillrenumber,infoAllrenumber,infoTime);
        }
        return b;
}


    //修改的删除
    @Override
    public boolean XiuGaiShanChu(DingDanInfo dingDanInfo) {
        return s.XiuGaiShanChu(dingDanInfo);
    }


    //修改订单和订单信息
    @Override
    public boolean updateDingDanXinXi(Map<String, Object> map) throws ParseException {
        List<Map<String,Object>> list =(List<Map<String,Object>>) map.get("id");    //用map接收，接收的是一个key,value的形式。id就是前端传过来的数组，数组里面会有多个对象，
        boolean b = false;                                                          //传过来的是{id=[   { 属性名=属性值，属性名=属性值  }   ]}这种形式。
        for(Map<String,Object> mm:list){
            Integer id = (Integer) mm.get("dingdaninfoId");
            Integer infoAllrenumber = (Integer) mm.get("infoAllrenumber");
            Integer infoWillrenumber = (Integer) mm.get("id");
            String infoTime1 = (String) mm.get("infoTime");
            String ss = infoTime1.replace("Z"," UTC");
            SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS Z");
            Date infoTime= sim.parse(ss);
            b=s.updateDingDanXinXi(id,infoAllrenumber,infoWillrenumber,infoTime);
        }
        return b;
    }

    //排产计划的全查
    @Override
    public List<Schedulingplan> quanchaPlan(Schedulingplan schedulingplan) {
        return s.quanchaPlan(schedulingplan);
    }

    //排产计划查询订单编码
    @Override
    public List<DingDan> selectDingdanEmpno(DingDan dingDan) {
        return s.selectDingdanEmpno(dingDan);
    }

    //排产计划查询订单编码
    @Override
    public boolean XinZengPaiChan(Map<String, Object> map) {
        boolean b=false;
        List<Map<String,Object>> list = (List<Map<String, Object>>) map.get("batchshuzu");
        b=s.XinZengPaiChan(map);
        Object id = map.get("id");
        for(Map<String,Object> ll:list){
            Object batchEmpno = ll.get("batchEmpno");
            Object batchName = ll.get("batchName");
            b=XinZengPiCi(id,batchEmpno,batchName);
        }
        return b;
    }

    @Transactional
    public boolean XinZengPiCi(Object id, Object batchEmpno, Object batchName) {
        return s.XinZengPiCi(id,batchEmpno,batchName);
    }


    //排产计划查询批次
    @Override
    public List<Batch> PiCiHuiXian(Batch batch) {
        return s.PiCiHuiXian(batch);
    }

    //订单号的回显
    @Override
    public Schedulingplan GenZongHaoHuiXian(Schedulingplan schedulingplan) {
        return s.GenZongHaoHuiXian(schedulingplan);
    }

    //删除订单批次
    @Override
    public int shanChuPiCi(Batch batch) {
        return s.shanChuPiCi(batch);
    }



    /*
            回显生产信息
     */
    @Override
    public List<Productioninformation> selectProductionInfo(Productioninformation productioninformation) {
        return s.selectProductionInfo(productioninformation);
    }

    /*
        删除生产信息
     */
    @Override
    public boolean removeProductionInfo(Productioninformation productioninformation) {
        return s.removeProductionInfo( productioninformation);
    }

    /*
        查询跟进信息表
     */
    @Override
    public List<Followup> selectgenjinInfo(Followup followup) {
        return s.selectgenjinInfo(followup);
    }

    //删除跟进信息
    @Override
    public boolean removeGenJinInfo(Followup followup) {
        return s.removeGenJinInfo(followup);
    }


    //修改添加生产信息
    @Override
    public boolean QueDingXiuGaiPiCi(Map<String,Object> map) {
        boolean b=false;
        List<Map<String,Object>> list = (List<Map<String, Object>>) map.get("shuzu");
        Integer id = (Integer) map.get("id");
        for(Map<String,Object> ll:list) {
            Object batchEmpno = ll.get("batchEmpno");
            Object batchName = ll.get("batchName");
                b=s.xiugaiXinXi(id,batchEmpno,batchName);           //修改
            }
        return b;
    }

    //添加生产信息
    @Override
    public boolean QueDingTianjiaPiCi(Map<String, Object> map) {
        boolean b=false;
        List<Map<String,Object>> list = (List<Map<String, Object>>) map.get("shuzu");
        Object batchId = map.get("batchId");
        for(Map<String,Object> ll:list) {
            Object batchEmpno = ll.get("batchEmpno");
            Object batchName = ll.get("batchName");
                b=s.tianjiaXinXi(batchEmpno,batchName,batchId);     //添加
            }
        return b;
    }

    //全部数据的回显
    @Override
    public List<Batch> QuanHuiXian(Batch batch) {
        return s.QuanHuiXian(batch);
    }

    //点击新增时的查询判断
    @Override
    public List<Schedulingplan> LianChaXinZengPanDuan(Schedulingplan schedulingplan) {
        return s.LianChaXinZengPanDuan(schedulingplan);
    }

    @Override
    public Schedulingplan selectPaiChanHao(Schedulingplan schedulingplan) {
        return s.selectPaiChanHao(schedulingplan);
    }

    @Override
    public List<Batch> selectPiCiHao(Batch batch) {
        return s.selectPiCiHao(batch);
    }


    @Override
    public List<Product> selectProduct(Product product) {
        return s.selectProduct(product);
    }

    //查询跟进信息
    @Override
    public List<Followup> selectFollowUp(Followup followup) {
        return s.selectFollowUp(followup);
    }



    @Override
    public List<XiaoShuo> selectZongTuiJian(XiaoShuo xiaoShuo) { return s.selectZongTuiJian(xiaoShuo); }
    @Override
    public List<XiaoShuo> FirstClassify(XiaoShuo xiaoShuo) { return s.FirstClassify(xiaoShuo); }
    @Override
    public List<XiaoShuo> SecondClassify(XiaoShuo xiaoShuo) { return s.SecondClassify(xiaoShuo); }
    @Override
    public List<XiaoShuo> ThirdClassify(XiaoShuo xiaoShuo) { return s.ThirdClassify(xiaoShuo); }


}
