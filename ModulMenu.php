<?php

/**
 * Library Filter Auto
 */

namespace App\Libraries;

use DB, RolePerms, Auth;

class ModulMenu
{

    public static function modul($cat)
    {
        return DB::table('app_modul')
                    ->where('modul_cat_id', $cat)
                    ->orderBy('order','asc')
                    ->get();
    }

    public static function modules()
    {
        return DB::table('app_modul')
                    ->orderBy('app_modul.order','asc')
                    ->get();
    }
    public static function menu($mod)
    {
        return DB::table('app_menu')
                    ->where('modul_id', $mod)
                    ->orderBy('order','asc')
                    ->get();
    }
    public static function submenu($menu)
    {
        return DB::table('app_submenu')
                    ->where('menu_id', $menu)
                    ->orderBy('order','asc')
                    ->get();
    }

    // exists
    public static function isMenu($mod)
    {
        return DB::table('app_menu')->where('modul_id', $mod)->exists();
    }
    public static function isSubmenu($men)
    {
        return DB::table('app_submenu')->where('menu_id', $men)->exists();
    }

    // count
    public static function countSubmenu($men)
    {
        return DB::table('app_submenu')->where('menu_id', $men)->count();
    }
    public static function countMenu($mod)
    {
        return DB::table('app_menu')->where('modul_id', $mod)->count();
    }

    public static function modul_category()
    {
        // ====================================
        // case : check count modul category
        // ====================================

        // ----------------------------
        // 1. select permission in role user active
        // ----------------------------
        $permission = DB::table('app_permissions')
                          ->where('role_id', RolePerms::roleUser(Auth::id())->id_role)
                          ->get();

        // ----------------------------
        // 2. select modul in permission
        // ----------------------------
        $modul = array();
        foreach ($permission as $perm) {
            $modul[] = DB::table('app_modul')
                            ->where('id', $perm->modul_id)
                            ->get();
        }
        // ----------------------------
        // 3. select id kategori modul in modul
        // ----------------------------
        $mod_id = array();
        foreach ($modul as $mod) {
            $mod_id[] = $mod[0]->modul_cat_id;
        }
        // ----------------------------
        // 4. select kategori in modul_id
        // ----------------------------
        $kategori = DB::table('app_modul_category')
                         // ->whereIn('id', $mod_id)
                         ->orderBy('order', 'asc')
                         ->get();

        // ====================================
      return $kategori;
    }

    public static function moduls()
    {
        // ====================================
        // case : check count modul
        // ====================================

        // ----------------------------
        // 1. select permission in role user active
        // ----------------------------
        $permission = DB::table('app_permissions')
                          ->where('role_id', RolePerms::roleUser(Auth::id())->id_role)
                          ->get();

        // ----------------------------
        // 2. select menu in permission
        // ----------------------------
        $menu = array();
        foreach ($permission as $perm) {
            $menu[] = DB::table('app_menu')
                            ->where('id', $perm->menu_id)
                            ->get();
        }
        // ----------------------------
        // 3. select id modul in menu
        // ----------------------------
        $mod_id = array();
        foreach ($menu as $mod) {
            $mod_id[] = $mod[0]->modul_id;
        }
        // ----------------------------
        // 4. select kategori in modul_id
        // ----------------------------
        $modul = DB::table('setting_modul')
                         ->whereIn('id', $mod_id)
                         ->orderBy('order', 'asc')
                         ->get();

        // ====================================
      return $modul;
    }
}
