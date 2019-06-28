<?php
// +----------------------------------------------------------------------
// | Description: 组织架构
// +----------------------------------------------------------------------
// | Author:  
// +----------------------------------------------------------------------

namespace app\admin\model;

use app\admin\model\Common;
use think\Db;

class Structure extends Common 
{

    /**
     * 为了数据库的整洁，同时又不影响Model和Controller的名称
     * 我们约定每个模块的数据表都加上相同的前缀，比如CRM模块用crm作为数据表前缀
     */
	protected $name = 'admin_structure';

	/**
	 * [getDataList 获取列表]
	 * @return    [array]                         
	 */
	public function getDataList($type='')
	{	
		$cat = new \com\Category('admin_structure', array('id', 'pid', 'name', 'title'));
		$data = $cat->getList('', 0, 'id');
		// 若type为tree，则返回树状结构
		if ($type == 'tree') {
			$tree = new \com\Tree();
			$data = $tree->list_to_tree($data, 'id', 'pid', 'child', 0, true, array(''));
		}		
		return $data;
	}
	
	/*
	*根据字符串展示参与部门 use by work
	*add by yykun
	*/
	public function getDataByStr($idstr)
	{
		$idstr = substr($idstr,1,strlen($idstr)-2);
		if ( !$idstr ) {
			return false;
		}
		$list = $this->field('id as structure_id,name')->where('id in ('.$idstr.')')->select();
		return $list;
	}
	
	/*
	*根据部门ID获取信息 use by work 
	*add by yykun
	*/
	public function getDataByID( $id ='')
	{
		$det = Db::name('AdminStructure')->where('id ='.$id)->find();
		return $det;
	}

//    public function getDataById($id = '')
//    {
//        $data = $this->get($id);
//        if (!$data) {
//            $this->error = '暂无此数据';
//            return false;
//        }
//        return $data;
//    }
	public function delStrById($id)
	{
		if (!$id) {
			$this->error = '删除失败';
			return false;
		}
		$dataInfo = $this->getDataByID($id);
		if (empty($dataInfo['pid'])) {
			$this->error = '删除失败';
			return false;			
		}
		//部门是否被使用
		$allStrIds = [];
		$allStrIds[] = $id;
		$allSubStrIds = $this->getAllChild($id);
		$allStrIds = array_merge($allStrIds, $allSubStrIds); //全部关联部门（包含下属部门）
		$resUser = db('AdminUser')->where(['structure_id' => ['in',$allStrIds]])->find();
		if ($resUser) {
			$this->error = '该部门或其下属部门已存在员工，不能删除';
			return false;
		}
		$resDel = $this->delDataById($id, true);
		if (!$resDel) {
			$this->error = '删除失败';
			return false;
		} else {
			return true;
		}	
	}

	/**
	 * [getStructureNameByArr 根据主键获取详情]
	 * @param     string     $id [主键]
	 * @return    [array]
	 */
	public function getStructureNameByArr($ids = [])
	{
		if (!is_array($ids)) {
			$idArr[] = $ids;
		} else {
			$idArr = $ids;
		}		
		$data = $this->where(['id' => array('in', $idArr)])->column('name');
		return $data ? : [];
	}

	/*
	*根据字符串展示参与部门 use by work
	*add by yykun
	*/
	public function getListByStr($str)
	{
		$idArr = stringToArray($str);
		$list = $this->field('id,name')->where(['id' => ['in',$idArr]])->select();
		return $list;
	}

	public function createData($param)
	{
		// 验证
		$validate = validate($this->name);
		if (!$validate->check($param)) {
			$this->error = $validate->getError();
			return false;
		}
		try {
			$this->data($param)->allowField(true)->save();
			return true;
		} catch(\Exception $e) {
			$this->error = '添加失败';
			return false;
		}
	}

    /**
     * [delDataById 根据id删除数据]
     * @param     string                   $id     [主键]
     * @param     boolean                  $delSon [是否删除子孙数据]
     * @return    [type]                           [description]
     */
    public function delDataById($id = '', $delSon = false)
    {
        if (!$id) {
            $this->error = '删除失败';
            return false;
        }
        $this->startTrans();
        try {
            $this->where($this->getPk(), $id)->delete();
            if ($delSon && is_numeric($id)) {
                // 删除子孙
                $childIds = $this->getAllChild($id);
                if($childIds){
                    $this->where($this->getPk(), 'in', $childIds)->delete();
                }
            }
            $this->commit();
            return true;
        } catch(\Exception $e) {
            $this->error = '删除失败';
            $this->rollback();
            return false;
        }
    }

    public function updateDataById($param, $id)
	{
		$checkData = $this->get($id);
		if (!$checkData) {
			$this->error = '暂无此数据';
			return false;
		}

		// 验证
		$validate = validate($this->name);
		if (!$validate->scene('edit')->check($param)) {
			$this->error = $validate->getError();
			return false;
		}

		try {
			$this->allowField(true)->save($param, [$this->getPk() => $id]);
			return true;
		} catch(\Exception $e) {
			$this->error = '编辑失败';
			return false;
		}
	}

}