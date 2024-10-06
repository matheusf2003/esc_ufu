convert:
	python3 main.py < ./assemble/$(file)

	mv "python_out.hack" ./binary/$(basename $(file)).hack

	diff ./binary/$(basename $(file)).hack ./expected/$(basename $(file)).hack > ./errors/$(basename $(file)).diff && rm ./errors/$(basename $(file)).diff

clean-file:
	rm -f ./binary/$(basename $(file)).hack ./errors/$(basename $(file)).diff

clean:
	rm -f ./binary/*.hack ./errors/*.diff
