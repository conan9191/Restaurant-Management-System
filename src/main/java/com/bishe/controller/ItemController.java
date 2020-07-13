package com.bishe.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bishe.pojo.Accordion;
import com.bishe.pojo.Item;
import com.bishe.pojo.ItemForm;
import com.bishe.pojo.ItemMaterial;
import com.bishe.pojo.ItemType;
import com.bishe.pojo.Menu;
import com.bishe.pojo.Role;
import com.bishe.pojo.User;
import com.bishe.service.ItemService;
import com.bishe.service.SystemService;
import com.bishe.util.UUIDUtil;

@Controller
@RequestMapping("/manage")
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private SystemService systemService;
	/*
	 * 添加商品种类
	 */
	@RequestMapping("/addItemType")
	public String addItemType() {
		return "manage/addItemType";
	}

	/*
	 * 添加商品种类提交
	 */
	@RequestMapping("/addItemTypeCommit")
	public String addItemTypeCommit(ItemType itemType) {
		itemService.addItemType(itemType);
		return "redirect:/manage/findAllItemType";
	}

	/*
	 * 查询所有商品种类
	 */
	@RequestMapping("/findAllItemType")
	public String findItemType(HttpSession session,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		List<ItemType> itemTypes = itemService.findAllItemType();
		model.addAttribute("itemTypes", itemTypes);
		return "manage/findItemType";}
	}

	/*
	 * 修改商品种类名称
	 */
	@RequestMapping("/editItemType/{id}")
	public String editItemType(@PathVariable Integer id, Model model) {
		ItemType itemType = itemService.findItemTypeByPrimaryKey(id);
		model.addAttribute("itemType", itemType);
		return "/manage/editItemType";
	}

	/*
	 * 修改商品种类提交
	 */
	@RequestMapping("/editItemTypeCommit")
	public String editItemTypeCommit(ItemType itemType) {
		itemService.updateItemType(itemType);
		return "redirect:/manage/findAllItemType";
	}
	/*
	 * 查询商品种类 json
	 */
	@RequestMapping("/getItemType")
	@ResponseBody
	public ItemType getItemType(Integer id){
		return itemService.findItemTypeByPrimaryKey(id);
	}

	/*
	 * 根据主键删除商品种类
	 */
	@RequestMapping("/deleteItemType/{id}")
	public String deleteItemType(@PathVariable Integer id) {
		itemService.deleteItemType(id);
		return "redirect:/manage/findAllItemType";
	}

	/*
	 * 添加菜品
	 */
	@RequestMapping("/addItem")
	public String addItem(Model model) {
		List<ItemType> itemTypes = itemService.findAllItemType();
		model.addAttribute("itemTypes", itemTypes);
		return "manage/addItem";
	}

	/*
	 * 添加菜品提交
	 */
	@RequestMapping("/addItemCommit")
	public String addItemCommit(Item item, MultipartFile inputfile, Integer[] materialId, Integer itemTypeId,
			Integer[] materialNum, HttpSession session) throws IllegalStateException, IOException {
		if (!inputfile.isEmpty()) {
			// 设置item的文件名 UUID_filename 的格式存入数据
			String oldFileName = inputfile.getOriginalFilename();
			StringBuffer sb = new StringBuffer();
			sb.append(UUIDUtil.getUUID() + "_" + oldFileName);
			String filename = sb.toString();
			item.setFilename(filename);

			// 获取存储的真实路径
			String path = "/pic/";
			String directory = session.getServletContext().getRealPath(path);
			item.setPath(path);
			File filepath = new File(directory, filename);
			// 判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}
			// 将文件存入服务器
			inputfile.transferTo(filepath);
			// 将数据存入数据库
			itemService.addItem(item, materialId, itemTypeId, materialNum);

			return "redirect:/manage/findAllItem";
		} else {
			return "error";
		}
	}

	/*
	 * 查询菜品
	 */
	@RequestMapping("/findAllItem")
	public String findAllItem(HttpSession session,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		List<ItemForm> items = itemService.findAllItem();
		List<ItemType> itemTypes = itemService.findAllItemType();
		model.addAttribute("items", items);
		model.addAttribute("itemTypes",itemTypes);
		return "manage/findItem";}
	}
	/*
	 * 查询单个菜品 json
	 */
	@RequestMapping("/getItem")
	@ResponseBody
	public Item getItem(Integer id){
		return itemService.findItemByPrimar(id);
	}

	/*
	 * 删除菜品
	 */
	@RequestMapping("/deleteItem/{id}")
	public String deleteItem(@PathVariable Integer id) {
		itemService.deleteItem(id);
		return "redirect:/manage/findAllItem";
	}

	/*
	 * 修改菜品
	 */
	@RequestMapping("/editItem/{id}")
	public String editItem(@PathVariable Integer id, Model model) {
		Item item = itemService.findItemByPrimar(id);
		List<ItemType> itemTypes = itemService.findAllItemType();
		model.addAttribute("item", item);
		model.addAttribute("itemTypes", itemTypes);
		return "/manage/editItem";
	}

	/*
	 * 修改菜品提交
	 */
	@RequestMapping("/editItemCommit")
	public String editItemCommit(Item item, MultipartFile inputfile, Integer[] materialId, Integer itemTypeId,
			Integer[] materialNum, HttpSession session) throws IllegalStateException, IOException {
		if (!inputfile.isEmpty()) {
			// 设置item的文件名 UUID_filename 的格式存入数据
			String oldFileName = inputfile.getOriginalFilename();
			StringBuffer sb = new StringBuffer();
			sb.append(UUIDUtil.getUUID() + "_" + oldFileName);
			String filename = sb.toString();
			item.setFilename(filename);

			// 获取存储的真实路径
			String path = "/pic/";
			String directory = session.getServletContext().getRealPath(path);
			item.setPath(path);
			File filepath = new File(directory, filename);
			// 判断路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}
			// 将文件存入服务器
			inputfile.transferTo(filepath);
			// 将数据存入数据库
			itemService.updateItem(item, materialId, itemTypeId, materialNum);

			return "redirect:/manage/findAllItem";
		} else {
			return "error";
		}
	}

	/*
	 * 添加原料提交
	 */
	@RequestMapping("/addItemMaterialCommit")
	public String addItemMaterialCommit(ItemMaterial itemMaterial) {
		itemService.addItemMaterial(itemMaterial);
		return "redirect:/manage/findAllItemMaterial";
	}

	/*
	 * 查询所有原料
	 */
	@RequestMapping("/findAllItemMaterial")
	public String findAllItemMaterial(HttpSession session,Model model) {
		Integer error =locateMenus( session,model);
		if(error==-1||error==-2) return "admin/login";
		else {
		List<ItemMaterial> itemMaterials = itemService.findAllItemMaterial();
		model.addAttribute("itemMaterials", itemMaterials);
		return "manage/findItemMaterial";}
	}

	/*
	 * 删除原料
	 */
	@RequestMapping("/deleteItemMaterial/{id}")
	public String deleteItemMaterial(@PathVariable Integer id) {
		itemService.deleteItemMaterial(id);
		return "redirect:/manage/findAllItemMaterial";
	}

	/*
	 * 修改原料
	 */
	@RequestMapping("/editItemMaterial/{id}")
	public String editItemMaterial(@PathVariable Integer id, Model model) {
		ItemMaterial itemMaterial = itemService.findItemMaterialByPrimaryKey(id);
		model.addAttribute("itemMaterial", itemMaterial);
		return "/manage/editItemMaterial";
	}

	/*
	 * 修改原料提交
	 */
	@RequestMapping("/editItemMaterialCommit")
	public String editItemMaterialCommit(ItemMaterial itemMaterial) {
		itemService.updateItemMaterial(itemMaterial);
		return "redirect:/manage/findAllItemMaterial";
	}
	/*
	 * 通过主键获取原料 json
	 */
	@RequestMapping("/getItemMaterial")
	@ResponseBody
	public ItemMaterial getItemMaterial(Integer id){
		return itemService.findItemMaterialByPrimaryKey(id);
	}
	/*
	 * 获取全部原料json格式
	 */
	@RequestMapping("/getItemMaterials")
	@ResponseBody
	public List<ItemMaterial> getItemMaterials() {
		List<ItemMaterial> lists = itemService.findAllItemMaterial();
		return lists;
	}
	
	//获取菜单方法
	private List<Accordion> getAccordions(boolean isAdmin,Integer uid) {
		Set<String> permissionUrls = new HashSet<>();		
		Set<Integer> rootFunctionIdSet =  new HashSet<>();		
		if(!isAdmin) {
				List<Role> roles = systemService.findUserRolesByUserId(uid);
				Iterator<Role> it = roles.iterator();
				while(it.hasNext()) {
					List<Menu> menus = systemService.findMenusByRoleId(it.next().getId());
						Iterator<Menu> it2 = menus.iterator();
						while(it2.hasNext()) {
							Menu menu = it2.next();
							if(menu.getParentid()==0) {
								rootFunctionIdSet.add(menu.getId());
							}else {
								permissionUrls.add(menu.getUrl());
							}
						}
				}
		}
		Map<Integer,Accordion> accordionMap = new HashMap<>();		
		List<Accordion> permissionAccordionSet = new LinkedList<>();
		List<Menu> menus = systemService.findAllMenu();
		List<Accordion>rootAccordionSet = new LinkedList<>();
		Iterator<Menu> it3 = menus.iterator();
		while(it3.hasNext()) {
			Menu menu = it3.next();
			Accordion accordion = new Accordion(menu.getId(), menu.getParentid(), menu.getName(), menu.getUrl());
			accordionMap.put(menu.getId(), accordion );
			if(!isAdmin) {
				if(permissionUrls.contains(menu.getUrl())) {
					permissionAccordionSet.add(accordion);
				}
				if(rootFunctionIdSet.contains(menu.getId())) {
					rootAccordionSet.add(accordion);
				}
			}else {
				permissionAccordionSet.add(accordion);
				if(menu.getParentid()==0) {
					rootAccordionSet.add(accordion);
				}
			}
		}
		
		for(Accordion accordion : rootAccordionSet) {
			competeAccordion(permissionAccordionSet,accordion);
		}
		return rootAccordionSet;
	}
	
	//构建子菜单
	private void competeAccordion(List<Accordion> permissionAccordionSet, Accordion rootAccordionSet) {
		for(Accordion accordion : permissionAccordionSet) {
			if(accordion.getParentId()==rootAccordionSet.getId()) {
				 rootAccordionSet.getChildren().add(accordion);
			}
		}
	}
	
	//分配菜单方法
	private Integer locateMenus(HttpSession session,Model model) {
		//根据角色分配菜单
		User user=(User) session.getAttribute("user");
		if(user==null){
			 return -1;
		 }
		 List<Role> roles =systemService.findUserRolesByUserId(user.getId());
		 if(roles==null||roles.size()==0){
			 return -2;
		 }
		 Integer admin = 0;//记录角色类型
	
		 Iterator<Role> it = roles.iterator();
		 while(it.hasNext()) {
			 Integer rid = it.next().getId();
			 if(rid==1) //为管理员
				 admin=1;
		 }
		 if(admin==1) {
			 model.addAttribute("accordions",  getAccordions(true,null));
		 }else {
			 model.addAttribute("accordions",  getAccordions(false,user.getId()));
		 }
		 return 0;
	}

}
