add_rules("mode.debug","mode.release")

-- pcl的visualize模块使用 需要设置vtk=true
add_requires("pcl", {configs = {vtk=true}})
add_requires("opencv", "vtk", "eigen", "boost")

set_project("作业1")

set_languages("c++20")
set_toolchains("gcc","clang","mingw")

target("1_reading_pcd")
    -- 设置运行目录防止可执行文件找不到相对路径下的文件
    -- 你知道的，如下同理
    set_rundir("1_reading_pcd")
    set_kind("binary")
    add_packages("pcl")
    add_files("1_reading_pcd/*.cpp")

target("2_writing_pcd")
    set_rundir("2_writing_pcd")
    set_kind("binary")
    add_packages("pcl")
    add_files("2_writing_pcd/*.cpp")

target("3_pcd2ply")
    set_rundir("3_pcd2ply")
    set_kind("binary")
    add_packages("pcl")
    add_files("3_pcd2ply/*.cpp")

target("4_transformtorangeimage")
    set_rundir("4_transformtorangeimage")
    set_kind("binary")
    add_packages("pcl","opencv", "vtk", "eigen")
    -- linux上pcl可视化的模块需要以下链接以下系统库（没错就是这些X开头的和gomp，有问题就问ai去）
    if is_plat("linux") then
        add_syslinks("X11", "Xext", "Xft", "Xrender","Xcursor")
        add_syslinks("gomp")
    end
    -- win上的还没写好
    add_files("4_transformtorangeimage/*.cpp")

