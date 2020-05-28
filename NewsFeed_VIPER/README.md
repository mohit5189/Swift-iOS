# Steps to generate project schema

1- Create schema of files and put inside template folder. Add for Test as well.
2- Use generamba to generate ramba file, replace template path.
3- Copy scripts folder at root.
4- Use Cuckoo for mocking, it will pick path from Scripts/CuckooInputFiles.xcfilelist, which contains all entries for files where mock needed.
5- Add run script in Test target, which will create mock before files compilation.

# Steps to create Module:
1. Go to root folder through terminal

2. Run in terminal generamba gen [Module-Name] viper

3. Then run scripts/link_module.sh [Module-Name] -> It will create entry in DependencyManager (defined in script), also in Scripts/CuckooInputFiles.xcfilelist

4. You can find module in Modules folder.



