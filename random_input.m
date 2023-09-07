%type2
numNodes = 1000;  % Number of nodes
p = 0.2; % Probability of edge existence
additionalConnections = 50;  % Number of additional random connections to add

% Create a random connected graph
adjacencyMatrix = rand(numNodes) < p;
adjacencyMatrix = triu(adjacencyMatrix, 1);  % Make it upper triangular to avoid self-loops
adjacencyMatrix = adjacencyMatrix + adjacencyMatrix.';  % Make it symmetric

% Add additional random connections
for i = 1:additionalConnections
    nodeA = randi([1, numNodes]);
    nodeB = randi([1, numNodes]);
    if nodeA ~= nodeB
        adjacencyMatrix(nodeA, nodeB) = 1;
        adjacencyMatrix(nodeB, nodeA) = 1;
    end
end

% Convert adjacency matrix to graph object
G = graph(adjacencyMatrix);

% Randomly assign source and destination nodes
sourceNode = randi([1, numNodes]);
destinationNode = randi([1, numNodes]);

% Input validation
if sourceNode == destinationNode
    disp('Source and destination nodes cannot be the same.');
    return;
end

% Find the shortest path
shortestPath = shortestpath(G, sourceNode, destinationNode);

% Display the route
disp("Least cost route:");
disp(shortestPath);

% Create a plot of the graph
figure;
p = plot(G, 'Layout', 'force'); % You can use different layouts like 'force', 'layered', etc.
highlight(p, shortestPath, 'NodeColor', 'r', 'MarkerSize', 6);

% Add labels to the nodes
labelnode(p, 1:numNodes, 1:numNodes);

% Set node labels to empty to improve visibility
p.NodeLabel = {};

% Set axis labels
xlabel('X-axis');
ylabel('Y-axis');
title('Random Graph and Shortest Path Visualization');

% Simulate communication along the route
disp("Simulating communication along the route:");
for i = 1:length(shortestPath)-1
    fprintf("Node %d communicates with Node %d\n", shortestPath(i), shortestPath(i+1));
    % Implement your communication protocol here
end