// Kill All Jenkins Jobs
import jenkins.model.*

def jenkins = Jenkins.getInstance()

// Cancel queued items
jenkins.queue.items.each { item ->
    item.doCancel()
}

// Cancel running builds
jenkins.nodes.each { node ->
    node.getComputer().getExecutors().each { executor ->
        def build = executor.getCurrentExecutable()
        if (build != null) {
            build.doStop()
        }
    }
}
