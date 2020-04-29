ALFRED_WORKFLOW_PATH ?= ~/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows
SYMLINK_TARGET = ${ALFRED_WORKFLOW_PATH}/${BUNDLE_ID}


WORKFLOW_NAME = Do People Say
BUNDLE_ID = io.uechi.dopeoplesay-alfred-workflow

default: package

package:
	mkdir -p ./pkg
	rm -f "./pkg/${WORKFLOW_NAME}.alfredworkflow"
	cd workflow; zip -r "../${WORKFLOW_NAME}.zip" *
	mv "${WORKFLOW_NAME}.zip" "./pkg/${WORKFLOW_NAME}.alfredworkflow"

link:
	ln -s "$(PWD)/workflow" "${SYMLINK_TARGET}"

unlink:
	rm "${SYMLINK_TARGET}"