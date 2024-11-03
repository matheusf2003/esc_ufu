convert:
	python3 main.py < ./vm_files/$(file_name).vm

	mv "python_out.asm" ./asm_files/$(file_name).asm

clean-file:
	rm -f ./asm_files/$(file_name).asm

clean:
	rm -f ./asm_files/*.asm
