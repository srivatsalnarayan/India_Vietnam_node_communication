numNodes = 1000;  % Number of nodes
p = 0.2; % Probability of edge existence

% Create a random connected graph
adjacencyMatrix = rand(numNodes) < p;
adjacencyMatrix = triu(adjacencyMatrix, 1);  % Make it upper triangular to avoid self-loops
adjacencyMatrix = adjacencyMatrix + adjacencyMatrix.';  % Make it symmetric

% Convert adjacency matrix to graph object
G = graph(adjacencyMatrix);

% User input for start and end nodes
sourceNode = input('Enter the start node: ');
destinationNode = input('Enter the end node: ');

% Input validation
if sourceNode < 1 || sourceNode > numNodes || destinationNode < 1 || destinationNode > numNodes
    disp('Invalid node numbers.');
    return;
end

% Find the shortest path
shortestPath = shortestpath(G, sourceNode, destinationNode);

% Display the route
disp("Least cost route:");
disp(shortestPath);

% Simulate communication along the route
disp("Simulating communication along the route:");
for i = 1:length(shortestPath)-1
    fprintf("Node %d communicates with Node %d\n", shortestPath(i), shortestPath(i+1));
    % Implement your communication protocol here
end

